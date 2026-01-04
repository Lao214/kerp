package com.example.kerp.modules.psi.service.impl;/*
 *@title PsiSalesReturnItemImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 10:44
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.psi.entity.PsiInventory;
import com.example.kerp.modules.psi.entity.PsiSalesReturnItem;
import com.example.kerp.modules.psi.mapper.PsiSalesReturnItemMapper;
import com.example.kerp.modules.psi.service.PsiSalesReturnItemService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PsiSalesReturnItemServiceImpl extends ServiceImpl<PsiSalesReturnItemMapper, PsiSalesReturnItem> implements PsiSalesReturnItemService {


    @Override
    public List<PsiSalesReturnItem> listByReturnId(Long id) {
        // 1. 先查查这个仓库有没有这个商品
        LambdaQueryWrapper<PsiSalesReturnItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(PsiSalesReturnItem::getReturnId, id);

        List<PsiSalesReturnItem> list = this.list(wrapper);
        return list;
    }
}
