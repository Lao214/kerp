package com.example.kerp.modules.basic.service.impl;/*
 *@title BaseSupplierImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:28
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.entity.BaseSupplier;
import com.example.kerp.modules.basic.mapper.BaseSupplierMapper;
import com.example.kerp.modules.basic.service.BaseSupplierService;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class BaseSupplierServiceImpl extends ServiceImpl<BaseSupplierMapper, BaseSupplier> implements BaseSupplierService {

    @Transactional(rollbackFor = Exception.class)
    public boolean saveSupplier(BaseSupplier supplier) {
        // 校验编码重复
        LambdaQueryWrapper<BaseSupplier> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BaseSupplier::getCode, supplier.getCode());
        if (supplier.getId() != null) {
            wrapper.ne(BaseSupplier::getId, supplier.getId());
        }

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("供应商编码已存在: " + supplier.getCode());
        }

        return this.saveOrUpdate(supplier);
    }

    public List<OptionVO> getOptions() {
        return baseMapper.getOptions();
    }

    // 更新应付余额 (amount可以为负数，表示减少欠款)
    @Transactional(rollbackFor = Exception.class)
    public void updatePayableBalance(Long supplierId, BigDecimal amount) {
        BaseSupplier supplier = this.getById(supplierId);
        // 处理 null 情况，防止空指针
        BigDecimal current = supplier.getPayableBalance() == null ? BigDecimal.ZERO : supplier.getPayableBalance();
        supplier.setPayableBalance(current.add(amount));
        this.updateById(supplier);
    }
}