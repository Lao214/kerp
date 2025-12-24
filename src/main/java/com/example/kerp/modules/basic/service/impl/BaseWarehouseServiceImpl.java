package com.example.kerp.modules.basic.service.impl;/*
 *@title BaseWarehouseImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:28
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.entity.BaseWarehouse;
import com.example.kerp.modules.basic.mapper.BaseWarehouseMapper;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BaseWarehouseServiceImpl extends ServiceImpl<BaseWarehouseMapper, BaseWarehouse> {

    @Transactional(rollbackFor = Exception.class)
    public boolean saveProduct(BaseWarehouse warehouse) {
        // 校验编码重复
        LambdaQueryWrapper<BaseWarehouse> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BaseWarehouse::getCode, warehouse.getCode());
        if (warehouse.getId() != null) {
            wrapper.ne(BaseWarehouse::getId, warehouse.getId());
        }

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("仓库编码已存在: " + warehouse.getCode());
        }

        return this.saveOrUpdate(warehouse);
    }

    public List<OptionVO> getOptions() {
       return baseMapper.getOptions();
    }
}