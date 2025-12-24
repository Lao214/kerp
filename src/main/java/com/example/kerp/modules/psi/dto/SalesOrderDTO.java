package com.example.kerp.modules.psi.dto;

/*
 *@title SalesOrderDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/3 16:02
 */

import com.example.kerp.modules.psi.entity.SalesOrder;
import com.example.kerp.modules.psi.entity.SalesOrderItem;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 销售单传输对象
 * 继承 SalesOrder 从而拥有主表所有字段，同时增加 items 列表
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SalesOrderDTO extends SalesOrder {

    /** 子表数据：商品明细列表 */
    private List<SalesOrderItem> items;
}
