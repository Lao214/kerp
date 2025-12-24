package com.example.kerp.modules.basic.service.impl;/*
 *@title BaseProductImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:28
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.entity.BaseProduct;
import com.example.kerp.modules.basic.mapper.BaseProductMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BaseProductServiceImpl extends ServiceImpl<BaseProductMapper, BaseProduct> {

    @Transactional(rollbackFor = Exception.class)
    public boolean saveProduct(BaseProduct product) {
        // 校验编码重复
        LambdaQueryWrapper<BaseProduct> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BaseProduct::getProductCode, product.getProductCode());
        if (product.getId() != null) {
            wrapper.ne(BaseProduct::getId, product.getId());
        }

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("商品编码已存在: " + product.getProductCode());
        }

        return this.saveOrUpdate(product);
    }
}