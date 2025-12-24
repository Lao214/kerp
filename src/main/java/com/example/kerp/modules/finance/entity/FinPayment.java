package com.example.kerp.modules.finance.entity;/*
 *@title FinReceipt
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/9 10:08
 */

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("fin_payment")
public class FinPayment extends BaseEntity {

    private String paymentNo;

    private Long supplierId;

    private LocalDate paymentDate;

    private BigDecimal amount;

    private String paymentMethod;

    private Integer status;

    private String remark;

    private String createBy;
}
