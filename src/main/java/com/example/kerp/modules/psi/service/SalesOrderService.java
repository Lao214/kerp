package com.example.kerp.modules.psi.service;/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.dto.PurchaseOrderDTO;
import com.example.kerp.modules.psi.dto.SalesOrderDTO;
import com.example.kerp.modules.psi.entity.SalesOrder;

public interface SalesOrderService extends IService<SalesOrder> {

    public boolean saveOrder(SalesOrderDTO dto);

    void audit(Long id);

   IPage<SalesOrder> getPageWithScope(Page<SalesOrder> page, Wrapper<SalesOrder> wrapper);
}