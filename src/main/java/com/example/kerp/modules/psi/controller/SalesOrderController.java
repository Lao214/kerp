package com.example.kerp.modules.psi.controller;/*
 *@title SalesOrderController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 17:01
 */

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.psi.dto.PurchaseOrderDTO;
import com.example.kerp.modules.psi.dto.SalesOrderDTO;
import com.example.kerp.modules.psi.entity.PsiSerial;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import com.example.kerp.modules.psi.entity.SalesOrder;
import com.example.kerp.modules.psi.entity.SalesOrderItem;
import com.example.kerp.modules.psi.mapper.PsiSerialMapper;
import com.example.kerp.modules.psi.service.SalesOrderItemService;
import com.example.kerp.modules.psi.service.SalesOrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/psi/sales")
public class SalesOrderController {

    @Autowired
    private SalesOrderService orderService;

    @Autowired
    private SalesOrderItemService itemService;

    @Autowired
    private PsiSerialMapper serialMapper;

    // 销售开单
    @SaCheckPermission("psi:sales:add")
    @Log(title = "销售订单管理", businessType = "销售开单")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody SalesOrderDTO dto) {
        orderService.saveOrder(dto);
        return Result.success(true);
    }

    /**
     * 分页查询采购单列表
     */
    @SaCheckPermission("psi:sales:list")
    @GetMapping("/list")
    public Result<IPage<SalesOrder>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String orderNo,
            @RequestParam(required = false) Integer status) {

        Page<SalesOrder> pageParam = new Page<>(page, size);

        LambdaQueryWrapper<SalesOrder> wrapper = new LambdaQueryWrapper<>();
        // 1. 按单号模糊搜
        wrapper.like(StringUtils.hasText(orderNo), SalesOrder::getOrderNo, orderNo);
        // 2. 按状态精确搜
        wrapper.eq(status != null, SalesOrder::getStatus, status);
        // 3. 按时间倒序（最新的在最上面）
        wrapper.orderByDesc(SalesOrder::getCreateTime);

        return Result.success(orderService.getPageWithScope(pageParam, wrapper));
    }

    @SaCheckPermission("psi:sales:audit")
    @Log(title = "销售订单管理", businessType = "销售审核")
    @PutMapping("/audit/{id}")
    public Result<Boolean> audit(@PathVariable Long id) {
        orderService.audit(id);
        return Result.success(true);
    }

    @GetMapping("/detail/{id}")
    public Result<SalesOrderDTO> getDetail(@PathVariable Long id) {
        // 1. 查主表
        SalesOrder order = orderService.getById(id);
        // 2. 查子表
        List<SalesOrderItem> items = itemService.listWithProductInfo(id);

        // 3. 🔥 填充 SN 码 (用于前端回显)
        for (SalesOrderItem item : items) {
            // 查一下 psi_serial 表
            List<String> snList = serialMapper.selectList(new LambdaQueryWrapper<PsiSerial>()
                            .eq(PsiSerial::getInOrderNo, order.getOrderNo())
                            .eq(PsiSerial::getProductId, item.getProductId()))
                    .stream()
                    .map(PsiSerial::getSnCode)
                    .collect(Collectors.toList());

            // 塞回去 (虽然数据库没存，但 DTO 里有这个字段)
            item.setSnList(snList);

            // 顺便把 manageType 也查出来填回去，前端可能要用
            //item.setManageType(...)
        }

        // 4. 组装 DTO
        SalesOrderDTO dto = new SalesOrderDTO();
        BeanUtils.copyProperties(order, dto);
        dto.setItems(items);


        return Result.success(dto);
    }
}