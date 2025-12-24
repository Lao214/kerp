package com.example.kerp.modules.psi.mapper;/*
 *@title BaseProductMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:25
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PurchaseOrderItemMapper extends BaseMapper<PurchaseOrderItem> {


    List<PurchaseOrderItem> listWithProductInfo(@Param("orderId") Long orderId);
}
