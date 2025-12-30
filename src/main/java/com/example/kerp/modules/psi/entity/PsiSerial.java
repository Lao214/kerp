package com.example.kerp.modules.psi.entity;/*
 *@title PsiSerial
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/25 16:55
 */

import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;

import java.time.LocalDate;

@Data
public class PsiSerial extends BaseEntity {


    private Long warehouseId;

    private Long productId;

    private String snCode;

    /** '1:在库 2:已售 3:报损' **/
    private Integer status;
    /** 入库单号(来源) **/
    private String inOrderNo;
    /** 出库单号(去向) **/
    private String outOrderNo;

}
