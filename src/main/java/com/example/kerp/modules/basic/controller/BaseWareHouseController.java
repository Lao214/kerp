package com.example.kerp.modules.basic.controller;/*
 *@title BaseWarehouseController
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
import com.example.kerp.modules.basic.entity.BaseWarehouse;
import com.example.kerp.modules.basic.service.impl.BaseWarehouseServiceImpl;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/basic/warehouse")
public class BaseWareHouseController {

    @Autowired
    private BaseWarehouseServiceImpl warehouseService;

    // 分页查询
    @SaCheckPermission("base:warehouse:list")
    @GetMapping("/list")
    public Result<IPage<BaseWarehouse>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword) {

        Page<BaseWarehouse> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<BaseWarehouse> wrapper = new LambdaQueryWrapper<>();

        // 支持按名称或编码搜索
        if (StringUtils.hasText(keyword)) {
            wrapper.and(w -> w.like(BaseWarehouse::getName, keyword)
                    .or()
                    .like(BaseWarehouse::getCode, keyword));
        }
        wrapper.orderByDesc(BaseWarehouse::getCreateTime);

        return Result.success(warehouseService.page(pageParam, wrapper));
    }

    @GetMapping("/options")
    public Result<List<OptionVO>> options() {
        List<OptionVO> optionVOS =  warehouseService.getOptions();
        return Result.success(optionVOS);
    }

    // 新增
    @SaCheckPermission("base:warehouse:add")
    @Log(title = "仓库管理", businessType = "新增仓库")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody BaseWarehouse warehouse) {
        warehouseService.saveProduct(warehouse);
        return Result.success(true);
    }

    // 修改
    @SaCheckPermission("base:warehouse:edit")
    @Log(title = "仓库管理", businessType = "修改仓库")
    @PutMapping("/edit")
    public Result<Boolean> edit(@RequestBody BaseWarehouse warehouse) {
        warehouseService.saveProduct(warehouse);
        return Result.success(true);
    }

    // 删除
    @SaCheckPermission("base:warehouse:delete")
    @Log(title = "仓库管理", businessType = "修改仓库")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        warehouseService.removeBatchByIds(ids);
        return Result.success(true);
    }
}
