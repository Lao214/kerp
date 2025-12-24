package com.example.kerp.modules.system.controller;/*
 *@title SysMenuCOntroller
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 17:23
 */

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.system.entity.SysMenu;
import com.example.kerp.modules.system.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/system/menu")
public class SysMenuController {


    @Autowired
    private SysMenuService menuService;

    /**
     * 获取完整的菜单树 (用于分配权限)
     * Bro，这里为了不偷懒，我写了一个简单的递归构建树逻辑
     */
    @GetMapping("/tree")
    public Result<List<SysMenu>> getMenuTree() {
        // 1. 查出所有菜单
        List<SysMenu> allMenus = menuService.list(new LambdaQueryWrapper<SysMenu>()
                .orderByAsc(SysMenu::getSortOrder));

        // 2. 构建树形结构 (Java Stream流极简写法)
        List<SysMenu> tree = allMenus.stream()
                .filter(m -> m.getParentId() == 0) // 找根节点
                .map(m -> {
                    m.setChildren(getChildren(m, allMenus));
                    return m;
                }).collect(Collectors.toList());

        return Result.success(tree);
    }

    // 递归找子节点
    private List<SysMenu> getChildren(SysMenu root, List<SysMenu> all) {
        List<SysMenu> children = all.stream()
                .filter(m -> m.getParentId().equals(root.getId()))
                .map(m -> {
                    m.setChildren(getChildren(m, all));
                    return m;
                }).collect(Collectors.toList());
        return children.isEmpty() ? null : children;
    }
}
