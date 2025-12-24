package com.example.kerp.modules.basic.controller;/*
 *@title BaseProductController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:29
 */


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.common.api.Result;
import com.example.kerp.common.listener.ProductImportListener;
import com.example.kerp.modules.basic.dto.ProductExcelDTO;
import com.example.kerp.modules.basic.entity.BaseProduct;
import com.example.kerp.modules.basic.service.impl.BaseProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/basic/product")
public class BaseProductController {

    @Autowired
    private BaseProductServiceImpl productService;

    // 分页查询
    @SaCheckPermission("base:product:list")
    @GetMapping("/list")
    public Result<IPage<BaseProduct>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword) {

        Page<BaseProduct> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<BaseProduct> wrapper = new LambdaQueryWrapper<>();

        // 支持按名称或编码搜索
        if (StringUtils.hasText(keyword)) {
            wrapper.and(w -> w.like(BaseProduct::getProductName, keyword)
                    .or()
                    .like(BaseProduct::getProductCode, keyword));
        }
        wrapper.orderByDesc(BaseProduct::getCreateTime);

        return Result.success(productService.page(pageParam, wrapper));
    }

    // 新增
    @SaCheckPermission("base:product:add")
    @Log(title = "商品管理", businessType = "新增商品")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody BaseProduct product) {
        productService.saveProduct(product);
        return Result.success(true);
    }

    // 修改
    @SaCheckPermission("base:product:edit")
    @Log(title = "商品管理", businessType = "修改商品")
    @PutMapping("/edit")
    public Result<Boolean> edit(@RequestBody BaseProduct product) {
        productService.saveProduct(product);
        return Result.success(true);
    }

    // 删除
    @SaCheckPermission("base:product:delete")
    @Log(title = "商品管理", businessType = "删除商品")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        productService.removeBatchByIds(ids);
        return Result.success(true);
    }

    /**
     * Excel 导入商品
     */
    @Log(title = "商品管理", businessType = "导入商品")
    @PostMapping("/import")
    public Result<Boolean> importExcel(MultipartFile file) throws IOException {
        EasyExcel.read(file.getInputStream(), ProductExcelDTO.class,
                        new ProductImportListener(productService)) // 把 Service 传给 Listener
                .sheet().doRead();
        return Result.success(true);
    }
}
