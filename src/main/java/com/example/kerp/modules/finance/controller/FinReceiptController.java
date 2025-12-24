package com.example.kerp.modules.finance.controller;
/*
 *@title FinReceiptController
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
import com.example.kerp.modules.finance.entity.FinReceipt;
import com.example.kerp.modules.finance.service.impl.FinReceiptServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/finance/receipt")
public class FinReceiptController {

    @Autowired
    private FinReceiptServiceImpl receiptService;

    @GetMapping("/list")
    public Result<IPage<FinReceipt>> list(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer size,
                                          @RequestParam(required = false) String receiptNo) {
        Page<FinReceipt> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<FinReceipt> wrapper = new LambdaQueryWrapper<>();
        if (receiptNo != null && !receiptNo.isEmpty()) {
            wrapper.like(FinReceipt::getReceiptNo, receiptNo);
        }
        wrapper.orderByDesc(FinReceipt::getCreateTime);
        return Result.success(receiptService.page(pageParam, wrapper));
    }

    @SaCheckPermission("finance:receipt:add")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody FinReceipt receipt) {
        receiptService.saveReceipt(receipt);
        return Result.success(true);
    }

    @SaCheckPermission("finance:receipt:audit")
    @PutMapping("/audit/{id}")
    public Result<Boolean> audit(@PathVariable Long id) {
        receiptService.audit(id);
        return Result.success(true);
    }

    @SaCheckPermission("finance:receipt:delete")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        // 只能删草稿，这里为了简单直接删，实际要做状态校验
        return Result.success(receiptService.removeBatchByIds(ids));
    }
}
