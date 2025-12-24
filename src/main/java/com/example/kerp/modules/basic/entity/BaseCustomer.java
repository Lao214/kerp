package com.example.kerp.modules.basic.entity;/*
 *@title BaseCustomer
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/3 11:54
 */

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;


@Data
@EqualsAndHashCode(callSuper = true)
@TableName("base_customer")
public class BaseCustomer extends BaseEntity {

    private String code;
    private String name;
    private String contact;
    private String phone;
    private String email;
    private String address;
    private BigDecimal receivableBalance; // 应收余额
    private Integer status;
}