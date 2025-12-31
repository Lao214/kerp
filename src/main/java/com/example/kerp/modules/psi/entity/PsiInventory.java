package com.example.kerp.modules.psi.entity;
/*
 *@title PsiInventory
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 15:37
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("psi_inventory")
public class PsiInventory {
    // 库存表比较简单，不需要继承 BaseEntity 的逻辑删除那些
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long warehouseId;
    private Long productId;
    private Integer stockQuantity;
    private LocalDateTime updateTime;
    private BigDecimal avgCost;
}
