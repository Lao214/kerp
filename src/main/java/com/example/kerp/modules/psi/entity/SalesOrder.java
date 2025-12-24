package com.example.kerp.modules.psi.entity;/*
 *@title SalesOrder
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/3 15:53
 */

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("psi_sales_order")
public class SalesOrder extends BaseEntity {
    private String orderNo;
    private Long customerId;
    private Long warehouseId;
    private LocalDate orderDate;
    private BigDecimal totalAmount;
    private Integer totalQuantity;
    private Integer status; // 0:草稿 1:已审核
    private String remark;
    private Long createBy;
}

