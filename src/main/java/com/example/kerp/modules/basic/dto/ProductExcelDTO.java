package com.example.kerp.modules.basic.dto;

/*
 *@title ProductExcelDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 19:06
 */

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;
import java.math.BigDecimal;

@Data
public class ProductExcelDTO {
    @ExcelProperty("商品编码")
    private String productCode;

    @ExcelProperty("商品名称")
    private String productName;

    @ExcelProperty("单位(填个或件等单位)")
    private String unit;

    @ExcelProperty("采购价")
    private BigDecimal pricePurchase;

    @ExcelProperty("销售价")
    private BigDecimal priceSale;
}
