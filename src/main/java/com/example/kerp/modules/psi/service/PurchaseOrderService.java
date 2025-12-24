package com.example.kerp.modules.psi.service;/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.dto.PurchaseOrderDTO;
import com.example.kerp.modules.psi.entity.PurchaseOrder;

public interface PurchaseOrderService extends IService<PurchaseOrder> {
    public boolean saveOrder(PurchaseOrderDTO dto);

    void audit(Long id);

    PurchaseOrderDTO detail(Long id);

    IPage<PurchaseOrder> getPageWithScope(Page<PurchaseOrder> pageParam, LambdaQueryWrapper<PurchaseOrder> wrapper);
}