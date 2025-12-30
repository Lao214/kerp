package com.example.kerp.modules.basic.service;/*
 *@title BaseProductService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/26 16:01
 */

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.basic.entity.BaseCustomer;
import com.example.kerp.modules.basic.entity.BaseProduct;
import com.example.kerp.modules.basic.entity.BaseSupplier;

public interface BaseProductService extends IService<BaseProduct> {

    boolean saveProduct(BaseProduct supplier);
}
