package com.example.kerp.modules.basic.mapper;/*
 *@title BaseSupplierMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:25
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.basic.entity.BaseCustomer;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BaseCustomerMapper extends BaseMapper<BaseCustomer> {
    List<OptionVO> getOptions();
}
