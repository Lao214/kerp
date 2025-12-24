package com.example.kerp.modules.psi.service.impl;/*
 *@title PurchaseOrderServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:57
 */

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import com.example.kerp.modules.psi.mapper.PurchaseOrderItemMapper;
import com.example.kerp.modules.psi.service.PurchaseOrderItemService;

import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PurchaseOrderItemServiceImpl extends ServiceImpl<PurchaseOrderItemMapper, PurchaseOrderItem> implements PurchaseOrderItemService {


    @Override
    public List<PurchaseOrderItem> listWithProductInfo(Long id) {
        return baseMapper.listWithProductInfo(id);
    }
}
