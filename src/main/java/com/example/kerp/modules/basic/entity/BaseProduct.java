package com.example.kerp.modules.basic.entity;/*
 *@title BaseProduct
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:23
 */


import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal; // 👈 必须是这个包

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("base_product")
public class BaseProduct extends BaseEntity {

    /** 商品编码 (例如: P2023001) */
    private String productCode;

    /** 商品名称 */
    private String productName;

    /** 分类 */
    private String category;

    /** 单位 */
    private String unit;

    /** 采购价 */
    private BigDecimal pricePurchase;

    /** 销售价 */
    private BigDecimal priceSale;

    /** 状态 (1:上架 0:下架) */
    private Integer status;

    /** 备注 */
    private String remark;
}