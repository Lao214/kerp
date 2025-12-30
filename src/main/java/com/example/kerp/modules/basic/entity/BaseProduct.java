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

    /** 管理模式(0普通 1批次 2序列号) */
    private Integer manageType;
}

/**
 * 🛒 常见的“普通商品”类型（举例）
 * 商品类别	举例	为什么适合普通管理
 * 标准工业耗材	螺丝、螺母、垫片、电线、胶带	规格统一、无保质期、可互换性强
 * 通用办公用品	A4纸、签字笔、文件夹、回形针	无有效期，同型号完全等效
 * 标准化包装食品（短保但不严格追踪）	瓶装水、袋装方便面（若企业不要求批次追溯）	虽有保质期，但若销售快、不强制先进先出，可简化为普通商品
 * 虚拟商品 / 数字产品	充值卡（非实体）、软件授权码（未绑定设备）	无物理属性，纯数量管理
 * 低价快消品（简化管理）	口香糖、糖果、小零食（在小型零售场景）	成本低、周转快，企业选择不启用批次管理以降低操作复杂度
 * 原材料（部分场景）	沙子、水泥、标准钢材（若不要求炉号/批次追溯）	在不要求质量溯源的工程项目中
 */