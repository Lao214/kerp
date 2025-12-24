package com.example.kerp.modules.psi.service;/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;

import java.util.List;


public interface PurchaseOrderItemService extends IService<PurchaseOrderItem> {


    List<PurchaseOrderItem> listWithProductInfo(Long id);
}