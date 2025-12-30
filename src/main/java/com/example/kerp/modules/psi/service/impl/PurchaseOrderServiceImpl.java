package com.example.kerp.modules.psi.service.impl;
/*
 *@title PurchaseOrderServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:57
*/

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.service.BaseSupplierService;
import com.example.kerp.modules.psi.dto.PurchaseOrderDTO;
import com.example.kerp.modules.psi.entity.PsiSerial;
import com.example.kerp.modules.psi.entity.PurchaseOrder;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import com.example.kerp.modules.psi.mapper.PsiSerialMapper;
import com.example.kerp.modules.psi.mapper.PurchaseOrderMapper;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.service.PurchaseOrderItemService;
import com.example.kerp.modules.psi.service.PurchaseOrderService;
import org.flowable.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PurchaseOrderServiceImpl extends ServiceImpl<PurchaseOrderMapper, PurchaseOrder> implements PurchaseOrderService {

    @Autowired
    private PurchaseOrderItemService itemService; // 需要注入子表的 Service

    @Autowired
    private PsiInventoryService inventoryService; // 👈 注入它

    @Autowired
    private BaseSupplierService supplierService; // 注入

    @Autowired
    private RuntimeService runtimeService; // 注入 Flowable

    @Autowired
    private PsiSerialMapper serialMapper; // 注入 Mapper


    @Transactional(rollbackFor = Exception.class)
    public void audit(Long orderId) {
        // 1. 查询订单主表
        PurchaseOrder order = this.getById(orderId);
        if (order == null) {
            throw new RuntimeException("单据不存在");
        }
        if (order.getStatus() != 2) {
            throw new RuntimeException("只能审核状态为【审核中】的单据");
        }

        // 2. 查询订单明细
        List<PurchaseOrderItem> items = itemService.list(
                new LambdaQueryWrapper<PurchaseOrderItem>().eq(PurchaseOrderItem::getOrderId, orderId)
        );

        if (items.isEmpty()) {
            throw new RuntimeException("空单据无法审核");
        }

        // 3. 循环入库 (核心！)
        for (PurchaseOrderItem item : items) {
            // 给单据指定的仓库，增加对应商品的库存
            inventoryService.increaseStockComplex(order.getWarehouseId(), item, order.getOrderNo());
        }

        // 4. 修改单据状态 -> 已审核(1)
        order.setStatus(1);
        this.updateById(order);

        // 🔥 新增：审核通过，应付账款增加
        // 意思：货我收了，钱还没给，所以欠款增加了
        supplierService.updatePayableBalance(order.getSupplierId(), order.getTotalAmount());
    }

    @Override
    public PurchaseOrderDTO detail(Long orderId) {
        // 1. 查询订单主表
        PurchaseOrder order = this.getById(orderId);
        if (order == null) {
            throw new RuntimeException("单据不存在");
        }

        // 2. 查询订单明细
        List<PurchaseOrderItem> items = itemService.list(
                new LambdaQueryWrapper<PurchaseOrderItem>().eq(PurchaseOrderItem::getOrderId, orderId)
        );

        PurchaseOrderDTO purchaseOrderDTO = new PurchaseOrderDTO();
        // 将 order 的所有属性复制到 DTO（前提是字段名和类型一致）
        org.springframework.beans.BeanUtils.copyProperties(order, purchaseOrderDTO);

        purchaseOrderDTO.setItems(items);

        return purchaseOrderDTO;
    }

    @Override
    public IPage<PurchaseOrder> getPageWithScope(Page<PurchaseOrder> page, LambdaQueryWrapper<PurchaseOrder> wrapper) {
        // 调用我们刚才自定义的 Mapper 方法
        return baseMapper.selectPageScope(page, wrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean saveOrder(PurchaseOrderDTO dto) {
        // 1. 生成单号 (如果是新增)
        // 简单粗暴版：PO + 年月日 + 时间戳后6位 (实际生产要用 Redis 自增)
        if (dto.getId() == null) {
            String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String timeStamp = String.valueOf(System.currentTimeMillis());
            String suffix = timeStamp.substring(timeStamp.length() - 6);
            dto.setOrderNo("PO" + dateStr + suffix);
            dto.setStatus(2); // 默认为草稿
            dto.setCreateBy(StpUtil.getLoginIdAsLong());
        }

        // 2. 遍历明细，计算总金额和总数量 (后端计算最安全)
        BigDecimal totalAmount = BigDecimal.ZERO;
        int totalQty = 0;
        List<PurchaseOrderItem> items = dto.getItems();

        if (items == null || items.isEmpty()) {
            throw new RuntimeException("请至少选择一件商品！");
        }

        for (PurchaseOrderItem item : items) {
            // 计算行总价: 数量 * 单价
            BigDecimal lineTotal = item.getUnitPrice().multiply(new BigDecimal(item.getQuantity()));
            item.setTotalPrice(lineTotal);

            totalAmount = totalAmount.add(lineTotal);
            totalQty += item.getQuantity();
        }

        // 3. 保存主表
        dto.setTotalAmount(totalAmount);
        dto.setTotalQuantity(totalQty);
        this.saveOrUpdate(dto); // 此时 dto.getId() 就有值了

        // 4. 处理子表
        // 4.1 先删除旧的明细 (为了支持修改功能)
        if (dto.getId() != null) {
            itemService.remove(new LambdaQueryWrapper<PurchaseOrderItem>().eq(PurchaseOrderItem::getOrderId, dto.getId()));

            // 🔥 同时也删除旧的 SN 码 (防止用户修改时删减了SN)
            // 逻辑：删除所有来源单号 = 当前单号 且 状态 = 0 (待入库) 的记录
            serialMapper.delete(new LambdaQueryWrapper<PsiSerial>()
                    .eq(PsiSerial::getInOrderNo, dto.getOrderNo())
                    .eq(PsiSerial::getStatus, 0));
        }

        // 4.2 保存新明细 & 🔥 保存 SN 码
        for (PurchaseOrderItem item : dto.getItems()) {
            item.setOrderId(dto.getId());
            itemService.save(item); // 保存明细

            // --- 🔥此处为新增逻辑：持久化 SN 码 ---
            // 只有序列号管理的商品 (manageType=2) 才处理
            // 注意：这里需要前端传 manageType，或者你先查一遍商品表
            if (item.getSnList() != null && !item.getSnList().isEmpty()) {
                for (String sn : item.getSnList()) {
                    PsiSerial serial = new PsiSerial();
                    serial.setWarehouseId(dto.getWarehouseId()); // 关联仓库
                    serial.setProductId(item.getProductId());    // 关联商品
                    serial.setSnCode(sn);
                    serial.setInOrderNo(dto.getOrderNo());       // 记录来源单号
                    serial.setStatus(0);                         // ⚠️ 重点：状态设为 0 (待入库)
                    serialMapper.insert(serial);
                }
            }
        }

        // 🔥🔥🔥 启动流程实例 🔥🔥🔥
        Map<String, Object> variables = new HashMap<>();
        // 传入金额，供网关判断 (money >= 5000 ?)
        variables.put("money", dto.getTotalAmount().doubleValue());

        // key: 流程图ID, businessKey: 采购单ID, variables: 流程变量
        runtimeService.startProcessInstanceByKey("purchase_audit", dto.getId().toString(), variables);

        return true;
    }
}
