package com.example.kerp.modules.basic.controller;/*
 *@title BaseSupplierController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:29
 */


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.basic.entity.BaseSupplier;
import com.example.kerp.modules.basic.service.impl.BaseSupplierServiceImpl;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/basic/supplier")
public class BaseSupplierController {

    @Autowired
    private BaseSupplierServiceImpl supplierService;

    // 分页查询
    @SaCheckPermission("base:supplier:list")
    @GetMapping("/list")
    public Result<IPage<BaseSupplier>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword) {

        Page<BaseSupplier> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<BaseSupplier> wrapper = new LambdaQueryWrapper<>();

        // 支持按名称或编码搜索
        if (StringUtils.hasText(keyword)) {
            wrapper.and(w -> w.like(BaseSupplier::getName, keyword)
                    .or()
                    .like(BaseSupplier::getCode, keyword));
        }
        wrapper.orderByDesc(BaseSupplier::getCreateTime);

        return Result.success(supplierService.page(pageParam, wrapper));
    }

    //选项
    @GetMapping("/options")
    public Result<List<OptionVO>> options() {
        List<OptionVO> optionVOS =  supplierService.getOptions();
        return Result.success(optionVOS);
    }

    // 新增
    @SaCheckPermission("base:supplier:add")
    @Log(title = "供应商管理", businessType = "新增供应商")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody BaseSupplier supplier) {
        supplierService.saveSupplier(supplier);
        return Result.success(true);
    }

    // 修改
    @SaCheckPermission("base:supplier:edit")
    @Log(title = "供应商管理", businessType = "修改供应商")
    @PutMapping("/edit")
    public Result<Boolean> edit(@RequestBody BaseSupplier supplier) {
        supplierService.saveSupplier(supplier);
        return Result.success(true);
    }

    // 删除
    @SaCheckPermission("base:supplier:delete")
    @Log(title = "供应商管理", businessType = "删除供应商")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        supplierService.removeBatchByIds(ids);
        return Result.success(true);
    }
}
