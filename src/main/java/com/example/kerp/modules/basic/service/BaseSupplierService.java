package com.example.kerp.modules.basic.service;/*
 *@title BaseSupplierService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/9 09:56
 */

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.basic.entity.BaseSupplier;
import com.example.kerp.modules.basic.vo.OptionVO;

import java.math.BigDecimal;
import java.util.List;

public interface BaseSupplierService extends IService<BaseSupplier> {

    boolean saveSupplier(BaseSupplier supplier);

    void updatePayableBalance(Long customerId, BigDecimal amount);

    List<OptionVO> getOptions();
}
