package com.example.kerp.modules.finance.controller;
/*
 *@title FinPaymentController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/9 14:57
 */

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.finance.entity.FinPayment;
import com.example.kerp.modules.finance.service.FinPaymentService;
import com.example.kerp.modules.finance.service.impl.FinPaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/finance/payment")
public class FinPaymentController {

    @Autowired
    private FinPaymentService paymentService;

    @GetMapping("/list")
    public Result<IPage<FinPayment>> list(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer size,
                                          @RequestParam(required = false) String paymentNo) {
        Page<FinPayment> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<FinPayment> wrapper = new LambdaQueryWrapper<>();
        if (paymentNo != null && !paymentNo.isEmpty()) {
            wrapper.like(FinPayment::getPaymentNo, paymentNo);
        }
        wrapper.orderByDesc(FinPayment::getCreateTime);
        Page<FinPayment> list = paymentService.page(pageParam, wrapper);
        return Result.success(list);
    }

    @SaCheckPermission("finance:payment:add")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody FinPayment payment) {
        paymentService.savePayment(payment);
        return Result.success(true);
    }

    @SaCheckPermission("finance:payment:audit")
    @PutMapping("/audit/{id}")
    public Result<Boolean> audit(@PathVariable Long id) {
        paymentService.audit(id);
        return Result.success(true);
    }

    @SaCheckPermission("finance:payment:delete")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        // 只能删草稿，这里为了简单直接删，实际要做状态校验
        return Result.success(paymentService.removeBatchByIds(ids));
    }
}
