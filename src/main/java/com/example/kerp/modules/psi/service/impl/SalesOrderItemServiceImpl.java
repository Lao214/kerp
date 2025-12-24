package com.example.kerp.modules.psi.service.impl;/*
 *@title SalesOrderServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:57
 */

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.psi.entity.SalesOrderItem;
import com.example.kerp.modules.psi.mapper.SalesOrderItemMapper;
import com.example.kerp.modules.psi.service.SalesOrderItemService;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SalesOrderItemServiceImpl extends ServiceImpl<SalesOrderItemMapper, SalesOrderItem> implements SalesOrderItemService {


    @Override
    public List<SalesOrderItem> listWithProductInfo(Long id) {
        return baseMapper.listWithProductInfo(id);
    }
}
