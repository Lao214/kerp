package com.example.kerp.modules.basic.service.impl;/*
 *@title BaseCustomerImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:28
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.entity.BaseCustomer;
import com.example.kerp.modules.basic.mapper.BaseCustomerMapper;
import com.example.kerp.modules.basic.service.BaseCustomerService;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class BaseCustomerServiceImpl extends ServiceImpl<BaseCustomerMapper, BaseCustomer> implements BaseCustomerService {

    @Transactional(rollbackFor = Exception.class)
    public boolean saveCustomer(BaseCustomer customer) {
        // 校验编码重复
        LambdaQueryWrapper<BaseCustomer> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BaseCustomer::getCode, customer.getCode());
        if (customer.getId() != null) {
            wrapper.ne(BaseCustomer::getId, customer.getId());
        }

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("客户编码已存在: " + customer.getCode());
        }

        return this.saveOrUpdate(customer);
    }

    public List<OptionVO> getOptions() {
        return baseMapper.getOptions();
    }

    // 更新应收余额
    @Transactional(rollbackFor = Exception.class)
    public void updateReceivableBalance(Long customerId, BigDecimal amount) {
        BaseCustomer customer = this.getById(customerId);
        BigDecimal current = customer.getReceivableBalance() == null ? BigDecimal.ZERO : customer.getReceivableBalance();
        customer.setReceivableBalance(current.add(amount));
        this.updateById(customer);
    }
}