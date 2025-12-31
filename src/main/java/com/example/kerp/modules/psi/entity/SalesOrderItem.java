package com.example.kerp.modules.psi.entity;
/*
 *@title PurchaseOrderItem
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/1 16:50
 */

import com.baomidou.mybatisplus.annotation.*;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("psi_sales_order_item")
public class SalesOrderItem {
    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long orderId; // 🔗 核心外键
    private Long productId;
    private Integer quantity;
    private BigDecimal unitPrice;
    private BigDecimal totalPrice;
    private String remark;
    private BigDecimal costUnitPrice;

    @TableField(exist = false)
    private String productCode;

    @TableField(exist = false)
    private String productName;

    @TableField(exist = false)
    private String unit;

    @TableField(exist = false)
    private List<String> snList;  // SN列表 (仅序列号管理有效)
    /**
     * 逻辑删除
     * select * 时会自动带上 where is_deleted = 0
     */
    @TableLogic
    private Integer isDeleted;
}