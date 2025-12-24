package com.example.kerp.modules.psi.vo;/*
 *@title InventoryVO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 19:26
 */

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 库存查询展示对象
 * Bro，这个对象不是数据库表，而是专门给前端看的“拼盘”数据
 */
@Data
public class InventoryVO {
    private Long id;            // 库存记录ID
    private Long warehouseId;
    private String warehouseName; // 关联出来的仓库名

    private Long productId;
    private String productCode;   // 关联出来的商品编码
    private String productName;   // 关联出来的商品名称
    private String unit;          // 单位

    private Integer stockQuantity; // 库存数量
    private LocalDateTime updateTime; // 最后更新时间
}
