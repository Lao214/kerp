package com.example.kerp.modules.psi.entity;/*
 *@title PurchaseOrderItem
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:50
 */

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("psi_purchase_order_item")
public class PurchaseOrderItem extends BaseEntity {
    private Long orderId; // 🔗 核心外键
    private Long productId;
    private String productCode;
    private String productName;
    private String unit;
    private Integer quantity;
    private BigDecimal unitPrice;
    private BigDecimal totalPrice;
    private String remark;

    // ⚡️ 新增字段：用于接收前端传来的 WMS 信息
    @TableField(exist = false)
    private String batchNo;       // 批次号 (仅批次管理有效)

    @TableField(exist = false)
    private LocalDate expireDate; // 过期日期

    @TableField(exist = false)
    private List<String> snList;  // SN列表 (仅序列号管理有效)
}