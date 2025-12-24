package com.example.kerp.modules.basic.mapper;/*
 *@title BaseProductMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:25
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.basic.entity.BaseProduct;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BaseProductMapper extends BaseMapper<BaseProduct> {
}
