package com.example.kerp.modules.psi.controller;/*
 *@title PsiSalesReturnController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 13:57
 */

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.psi.dto.SalesReturnDTO;
import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import com.example.kerp.modules.psi.service.PsiSalesReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/psi/salesReturn")
public class PsiSalesReturnController {

    @Autowired
    private PsiSalesReturnService salesReturnService;

    /**
     * 库存查询报表
     */
    @SaCheckPermission("psi:return:list") // 记得在数据库 sys_menu 加这个权限
    @GetMapping("/list")
    public Result<IPage<PsiSalesReturn>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Long returnId) {

        return Result.success(salesReturnService.getReturnPage(page, size, keyword, returnId));
    }

    @SaCheckPermission("psi:return:add") // 记得在数据库 sys_menu 加这个权限
    @Log(title = "销售单管理", businessType = "销售单退货")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody SalesReturnDTO dto) {
        salesReturnService.saveReturn(dto);
        return Result.success(true);
    }

    // 3. 审核
    @SaCheckPermission("psi:return:audit")
    @PutMapping("/audit/{id}")
    public Result<Boolean> audit(@PathVariable Long id) {
        salesReturnService.audit(id);
        return Result.success(true);
    }

    // 4. 删除
    @SaCheckPermission("psi:return:delete")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        salesReturnService.deleteReturn(ids);
        return Result.success(true);
    }
}
