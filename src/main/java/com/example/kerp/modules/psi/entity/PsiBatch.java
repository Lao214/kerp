package com.example.kerp.modules.psi.entity;

/*
 *@title PsiBatch
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/25 16:49
 */

import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;

import java.time.LocalDate;

@Data
public class PsiBatch extends BaseEntity {

    private Long warehouseId;

    private Long productId;

    private String batchNo;

    private LocalDate productionDate;

    private LocalDate expireDate;

    private Integer quantity;
}
