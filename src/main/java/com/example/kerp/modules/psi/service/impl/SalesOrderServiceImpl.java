package com.example.kerp.modules.psi.service.impl;
/*
 *@title SalesOrderServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:57
*/

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.service.BaseCustomerService;
import com.example.kerp.modules.psi.dto.SalesOrderDTO;
import com.example.kerp.modules.psi.entity.SalesOrder;
import com.example.kerp.modules.psi.entity.SalesOrderItem;
import com.example.kerp.modules.psi.mapper.SalesOrderMapper;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.service.SalesOrderItemService;
import com.example.kerp.modules.psi.service.SalesOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class SalesOrderServiceImpl extends ServiceImpl<SalesOrderMapper, SalesOrder> implements SalesOrderService {

    @Autowired
    private SalesOrderItemService itemService; // 需要注入子表的 Service

    @Autowired
    private PsiInventoryService inventoryService; // 👈 注入它

    @Autowired
    private BaseCustomerService customerService; // 注入

    @Transactional(rollbackFor = Exception.class)
    public void audit(Long orderId) {
        // 1. 查询订单主表
        SalesOrder order = this.getById(orderId);
        if (order == null) {
            throw new RuntimeException("单据不存在");
        }
        if (order.getStatus() != 0) {
            throw new RuntimeException("只能审核草稿状态的单据");
        }

        // 2. 查询订单明细
        List<SalesOrderItem> items = itemService.list(
                new LambdaQueryWrapper<SalesOrderItem>().eq(SalesOrderItem::getOrderId, orderId)
        );

        if (items.isEmpty()) {
            throw new RuntimeException("空单据无法审核");
        }

        // 3. 循环扣减库存
        for (SalesOrderItem item : items) {
            // 调用刚才写的扣减方法，如果不够扣会抛异常，事务自动回滚
            inventoryService.decreaseStock(order.getWarehouseId(), item.getProductId(), item.getQuantity());
        }

        // 4. 更新状态 -> 已出库(1)
        order.setStatus(1);
        this.updateById(order);

        // 🔥 新增：审核通过，应收账款增加
        // 意思：货我发了，钱还没收，所以别人欠我的钱增加了
        customerService.updateReceivableBalance(order.getCustomerId(), order.getTotalAmount());
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean saveOrder(SalesOrderDTO dto) {
        // 1. 生成单号 (如果是新增)
        // 简单粗暴版：PO + 年月日 + 时间戳后6位 (实际生产要用 Redis 自增)
        if (dto.getId() == null) {
            String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String timeStamp = String.valueOf(System.currentTimeMillis());
            String suffix = timeStamp.substring(timeStamp.length() - 6);
            dto.setOrderNo("PO" + dateStr + suffix);
            dto.setStatus(0); // 默认为草稿
            dto.setCreateBy(StpUtil.getLoginIdAsLong());
        }

        // 2. 遍历明细，计算总金额和总数量 (后端计算最安全)
        BigDecimal totalAmount = BigDecimal.ZERO;
        int totalQty = 0;
        List<SalesOrderItem> items = dto.getItems();

        if (items == null || items.isEmpty()) {
            throw new RuntimeException("请至少选择一件商品！");
        }

        for (SalesOrderItem item : items) {
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

        // 4. 保存子表
        // 4.1 如果是修改，先删除旧的子表数据 (简单粗暴)
        if (dto.getId() != null) {
            // itemService.remove(new LambdaQueryWrapper<SalesOrderItem>().eq(SalesOrderItem::getOrderId, dto.getId()));
            // 为了简单，我们暂且假设这里只处理新增。修改逻辑后面细化。
        }

        // 4.2 关联主表 ID 并保存新明细
        Long orderId = dto.getId();
        items.forEach(item -> item.setOrderId(orderId));
        itemService.saveBatch(items); // 批量插入

        return true;
    }

    @Override
    public IPage<SalesOrder> getPageWithScope(Page<SalesOrder> page, Wrapper<SalesOrder> wrapper) {
        // 调用我们刚才自定义的 Mapper 方法
        return baseMapper.selectPageScope(page, wrapper);
    }
}
