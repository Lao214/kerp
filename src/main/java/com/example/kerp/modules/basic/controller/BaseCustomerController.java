package com.example.kerp.modules.basic.controller;/*
 *@title BaseCustomerController
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
import com.example.kerp.modules.basic.entity.BaseCustomer;
import com.example.kerp.modules.basic.service.impl.BaseCustomerServiceImpl;
import com.example.kerp.modules.basic.vo.OptionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/basic/customer")
public class BaseCustomerController {

    @Autowired
    private BaseCustomerServiceImpl customerService;

    // 分页查询
    @SaCheckPermission("base:customer:list")
    @GetMapping("/list")
    public Result<IPage<BaseCustomer>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword) {

        Page<BaseCustomer> pageParam = new Page<>(page, size);
        LambdaQueryWrapper<BaseCustomer> wrapper = new LambdaQueryWrapper<>();

        // 支持按名称或编码搜索
        if (StringUtils.hasText(keyword)) {
            wrapper.and(w -> w.like(BaseCustomer::getName, keyword)
                    .or()
                    .like(BaseCustomer::getCode, keyword));
        }
        wrapper.orderByDesc(BaseCustomer::getCreateTime);

        return Result.success(customerService.page(pageParam, wrapper));
    }

    //选项
    @GetMapping("/options")
    public Result<List<OptionVO>> options() {
        List<OptionVO> optionVOS =  customerService.getOptions();
        return Result.success(optionVOS);
    }

    // 新增
    @SaCheckPermission("base:customer:add")
    @Log(title = "客户管理", businessType = "新增客户")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody BaseCustomer customer) {
        customerService.saveCustomer(customer);
        return Result.success(true);
    }

    // 修改
    @SaCheckPermission("base:customer:edit")
    @Log(title = "客户管理", businessType = "修改客户")
    @PutMapping("/edit")
    public Result<Boolean> edit(@RequestBody BaseCustomer customer) {
        customerService.saveCustomer(customer);
        return Result.success(true);
    }

    // 删除
    @SaCheckPermission("base:customer:delete")
    @Log(title = "客户管理", businessType = "删除客户")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        customerService.removeBatchByIds(ids);
        return Result.success(true);
    }
}
