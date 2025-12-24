package com.example.kerp.modules.system.controller;
/*
 *@title SysDeptController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/16 16:07
 */

import com.example.kerp.common.api.Result;
import com.example.kerp.modules.system.entity.SysDept;
import com.example.kerp.modules.system.service.impl.SysDeptServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system/dept")
public class SysDeptController {
    @Autowired
    private SysDeptServiceImpl deptService;

    // 获取列表（树形结构）
    @GetMapping("/list")
    public Result<List<SysDept>> list() {
        return Result.success(deptService.getDeptTree());
    }

    // 新增
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody SysDept dept) {
        deptService.save(dept);
        return Result.success(true);
    }

    // 修改、删除略 (BaseMapper自带)
    // 注意：删除部门前最好检查一下该部门下有没有用户，或者有没有子部门
}
