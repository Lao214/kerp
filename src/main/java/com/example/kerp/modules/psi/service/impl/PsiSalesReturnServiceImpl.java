package com.example.kerp.modules.psi.service.impl;/*
 *@title PsiSalesReturnItemImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 10:44
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.service.BaseCustomerService;
import com.example.kerp.modules.psi.dto.SalesReturnDTO;
import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import com.example.kerp.modules.psi.entity.PsiSalesReturnItem;
import com.example.kerp.modules.psi.mapper.PsiSalesReturnMapper;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.service.PsiSalesReturnItemService;
import com.example.kerp.modules.psi.service.PsiSalesReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PsiSalesReturnServiceImpl extends ServiceImpl<PsiSalesReturnMapper, PsiSalesReturn> implements PsiSalesReturnService {

    @Autowired
    private PsiInventoryService inventoryService;
    @Autowired
    private BaseCustomerService customerService;
    @Autowired
    private PsiSalesReturnItemService returnItemService;

    @Transactional(rollbackFor = Exception.class)
    public void audit(Long id) {
        PsiSalesReturn returnOrder = this.getById(id);
        if (returnOrder.getStatus() != 0) return;

        List<PsiSalesReturnItem> items = returnItemService.listByReturnId(id); // 需实现

        // 1. 库存回滚
        for (PsiSalesReturnItem item : items) {
            // 这里要记得把前端传来的 SN 码塞进 item 里 (如果是从详情接口查的需要额外处理)
            // 假设 item 里已经有了 snList
            inventoryService.salesReturnStock(returnOrder.getWarehouseId(), item, returnOrder.getReturnNo());
        }

        // 2. 财务冲红 (减少应收账款)
        // 传入负数，表示客户欠我的钱变少了
        customerService.updateReceivableBalance(returnOrder.getCustomerId(), returnOrder.getTotalAmount().negate());

        // 3. 更新状态
        returnOrder.setStatus(1);
        this.updateById(returnOrder);
    }

    @Override
    public IPage<PsiSalesReturn> getReturnPage(Integer page, Integer size, String keyword, Long returnId) {
        // 构造分页对象，泛型要是 VO
        Page<PsiSalesReturn> pageParam = new Page<>(page, size);
        // 调用自定义 Mapper
        return baseMapper.selectReturnPage(pageParam, keyword, returnId);
    }

    @Override
    /**
     * 1. 新增/保存退货单
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean saveReturn(SalesReturnDTO dto) {
        // 1. 生成单号
        if (dto.getId() == null) {
            dto.setReturnNo("SR" + System.currentTimeMillis());
            dto.setStatus(0); // 草稿
        }

        // 2. 保存主表
        this.saveOrUpdate(dto);

        // 3. 保存子表
        // 先删旧的 (如果是修改)
        if (dto.getId() != null) {
            returnItemService.remove(new LambdaQueryWrapper<PsiSalesReturnItem>()
                    .eq(PsiSalesReturnItem::getReturnId, dto.getId()));
        }

        List<PsiSalesReturnItem> items = dto.getItems();
        for (PsiSalesReturnItem item : items) {
            item.setReturnId(dto.getId());

            // 🔥 核心：把 snList 转成 String 存库
            if (item.getSnList() != null && !item.getSnList().isEmpty()) {
                item.setSnCodes(String.join(",", item.getSnList()));
            }

            returnItemService.save(item);
        }
        return true;
    }

    /**
     * 3. 删除退货单
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteReturn(List<Long> ids) {
        // 校验状态
        Long count = this.lambdaQuery()
                .in(PsiSalesReturn::getId, ids)
                .ne(PsiSalesReturn::getStatus, 0) // 状态不是0的
                .count();
        if (count > 0) {
            throw new RuntimeException("只能删除草稿状态的单据");
        }

        // 删子表
        returnItemService.remove(new LambdaQueryWrapper<PsiSalesReturnItem>()
                .in(PsiSalesReturnItem::getReturnId, ids));
        // 删主表
        return this.removeBatchByIds(ids);
    }
}
