package com.example.kerp.modules.psi.controller;/*
 *@title PsiInventoryController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 19:32
 */


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.vo.InventoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/psi/inventory")
public class PsiInventoryController {

    @Autowired
    private PsiInventoryService inventoryService;

    /**
     * 库存查询报表
     */
    @GetMapping("/list")
    public Result<IPage<InventoryVO>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Long warehouseId) {

        return Result.success(inventoryService.getInventoryPage(page, size, keyword, warehouseId));
    }
}
