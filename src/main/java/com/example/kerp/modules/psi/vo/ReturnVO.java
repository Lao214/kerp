package com.example.kerp.modules.psi.vo;/*
 *@title ReturnVO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 14:03
 */

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class ReturnVO {

    private Long id;
    /**
     * 创建时间
     * 对应数据库 create_time
     */
    private LocalDateTime createTime;
    // 退货单号(SR...)
    private String returnNo;
    // 源销售单号
    private String sourceOrderNo;
    // 顾客ID
    private Long customerId;
    // 退入仓库
    private Long warehouseId;
    // 退回日期
    private LocalDate returnDate;
    // 退款金额
    private BigDecimal totalAmount;
    // 总数量
    private Integer totalQuantity;
    // 0：草稿， 1：已审核
    private Integer status;
    // 备注
    private String remark;
    // 创建人
    private String createBy;
}
