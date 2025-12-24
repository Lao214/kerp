package com.example.kerp.modules.basic.service;/*
 *@title BaseCustomerService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/9 09:56
 */

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.basic.entity.BaseCustomer;
import com.example.kerp.modules.basic.vo.OptionVO;

import java.math.BigDecimal;
import java.util.List;

public interface BaseCustomerService extends IService<BaseCustomer> {

    boolean saveCustomer(BaseCustomer supplier);

    void updateReceivableBalance(Long customerId, BigDecimal amount);

    List<OptionVO> getOptions();
}
