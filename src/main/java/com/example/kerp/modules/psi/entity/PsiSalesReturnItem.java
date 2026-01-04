package com.example.kerp.modules.psi.entity;
/*
 *@title PsiSalesReturn
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 09:46
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
public class PsiSalesReturnItem {


    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    // 退货单号(SR...)ID
    private Long returnId;
    // 退货商品ID
    private Long productId;
    // 数量
    private Integer quantity;
    // 退货单价(通常等于原销售价)
    private BigDecimal unitPrice;
    // 退货总价
    private BigDecimal totalPrice;
    // 删除
    private Integer isDeleted;
    // SNCodes
    private String snCodes;
    // 备注
    private String remark;
    @TableField(exist = false)
    private List<String> snList;
    @TableField(exist = false)
    private String batchNo;
    @TableField(exist = false)
    private LocalDate expireDate;
}
