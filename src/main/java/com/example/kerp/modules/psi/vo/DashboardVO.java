package com.example.kerp.modules.psi.vo;
/*
 *@title DashboardVO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 15:40
 */


import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Data
public class DashboardVO {
    // 顶部四个大数字
    private BigDecimal todaySales;    // 今日销售额
    private BigDecimal todayPurchase; // 今日采购额
    private Integer totalStock;       // 当前总库存数
    private BigDecimal totalSales;    // 累计销售额

    // 图表数据 (近7天趋势)
    private List<String> dates;            // X轴：日期 ["11-01", "11-02"...]
    private List<BigDecimal> salesTrend;   // Y轴：销售曲线
    private List<BigDecimal> purchaseTrend;// Y轴：采购曲线
}