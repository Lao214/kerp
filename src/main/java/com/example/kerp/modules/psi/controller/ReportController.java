package com.example.kerp.modules.psi.controller;/*
 *@title ReportController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 16:01
 */
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.psi.entity.PsiInventory;
import com.example.kerp.modules.psi.entity.PurchaseOrder;
import com.example.kerp.modules.psi.entity.SalesOrder;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.service.PurchaseOrderService;
import com.example.kerp.modules.psi.service.SalesOrderService;
import com.example.kerp.modules.psi.vo.DashboardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private SalesOrderService salesService;
    @Autowired
    private PurchaseOrderService purchaseService;
    @Autowired
    private PsiInventoryService inventoryService;

    @GetMapping("/dashboard")
    public Result<DashboardVO> getDashboardData() {
        DashboardVO vo = new DashboardVO();
        LocalDate today = LocalDate.now();

        // 1. 统计今日销售额 (状态=1已出库)
        BigDecimal todaySales = salesService.list(new LambdaQueryWrapper<SalesOrder>()
                        .eq(SalesOrder::getOrderDate, today)
                        .eq(SalesOrder::getStatus, 1))
                .stream().map(SalesOrder::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        vo.setTodaySales(todaySales);

        // 2. 统计今日采购额 (状态=1已入库)
        BigDecimal todayPurchase = purchaseService.list(new LambdaQueryWrapper<PurchaseOrder>()
                        .eq(PurchaseOrder::getOrderDate, today)
                        .eq(PurchaseOrder::getStatus, 1))
                .stream().map(PurchaseOrder::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        vo.setTodayPurchase(todayPurchase);

        // 3. 统计当前总库存
        Integer totalStock = inventoryService.list().stream()
                .mapToInt(PsiInventory::getStockQuantity).sum();
        vo.setTotalStock(totalStock);

        // 4. 统计累计销售额 (简单粗暴全量统计，实际要缓存)
        BigDecimal totalSales = salesService.list(new LambdaQueryWrapper<SalesOrder>()
                        .eq(SalesOrder::getStatus, 1))
                .stream().map(SalesOrder::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        vo.setTotalSales(totalSales);

        // 5. 组装近7天趋势图数据 (这是重点！)
        List<String> dates = new ArrayList<>();
        List<BigDecimal> salesTrend = new ArrayList<>();
        List<BigDecimal> purchaseTrend = new ArrayList<>();

        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("MM-dd");

        // 循环过去7天
        for (int i = 6; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            dates.add(date.format(fmt));

            // 查当天的销售总额 (SQL: select sum(amount) where date = ?)
            BigDecimal daySales = salesService.list(new LambdaQueryWrapper<SalesOrder>()
                            .eq(SalesOrder::getOrderDate, date).eq(SalesOrder::getStatus, 1))
                    .stream().map(SalesOrder::getTotalAmount).reduce(BigDecimal.ZERO, BigDecimal::add);
            salesTrend.add(daySales);

            // 查当天的采购总额
            BigDecimal dayPurchase = purchaseService.list(new LambdaQueryWrapper<PurchaseOrder>()
                            .eq(PurchaseOrder::getOrderDate, date).eq(PurchaseOrder::getStatus, 1))
                    .stream().map(PurchaseOrder::getTotalAmount).reduce(BigDecimal.ZERO, BigDecimal::add);
            purchaseTrend.add(dayPurchase);
        }

        vo.setDates(dates);
        vo.setSalesTrend(salesTrend);
        vo.setPurchaseTrend(purchaseTrend);

        // 🔥 新增：统计总毛利
        BigDecimal profit = salesService.list(new LambdaQueryWrapper<SalesOrder>()
                        .eq(SalesOrder::getStatus, 1)) // 已审核
                .stream()
                .map(SalesOrder::getTotalProfit)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        vo.setProfit(profit);

        // 🔥 新增：统计今日毛利
        BigDecimal todayProfit = salesService.list(new LambdaQueryWrapper<SalesOrder>()
                        .eq(SalesOrder::getOrderDate, today)
                        .eq(SalesOrder::getStatus, 1)) // 已审核
                .stream()
                .map(SalesOrder::getTotalProfit)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        vo.setTodayProfit(todayProfit);

        return Result.success(vo);
    }
}
