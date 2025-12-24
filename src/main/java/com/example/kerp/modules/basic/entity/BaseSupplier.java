package com.example.kerp.modules.basic.entity;/*
 *@title BaseSupplier
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 16:03
 */


import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("base_supplier")
public class BaseSupplier extends BaseEntity {
    private String code;
    private String name;
    private String contact;
    private String phone;
    private String email;
    private String address;
    private BigDecimal payableBalance; // 应付余额
    private Integer status;
    private String remark;
}
