package com.example.kerp.modules.psi.dto;/*
 /*
 *@title PurchaseOrderDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:55
 */

import com.example.kerp.modules.psi.entity.PurchaseOrder;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.List;

/**
 * 采购单传输对象
 * 继承 PurchaseOrder 从而拥有主表所有字段，同时增加 items 列表
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class PurchaseOrderDTO extends PurchaseOrder {

    /** 子表数据：商品明细列表 */
    private List<PurchaseOrderItem> items;
}