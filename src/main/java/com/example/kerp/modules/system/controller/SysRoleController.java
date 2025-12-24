package com.example.kerp.modules.system.controller;
/*
 *@title SysRoleController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 10:15
 */

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.system.dto.RoleMenuDTO;
import com.example.kerp.modules.system.entity.SysRole;
import com.example.kerp.modules.system.entity.SysRoleMenu;
import com.example.kerp.modules.system.service.SysRoleMenuService;
import com.example.kerp.modules.system.service.SysRoleService;
import com.example.kerp.modules.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/system/role")
public class SysRoleController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysRoleService roleService;

    @Autowired
    private SysRoleMenuService roleMenuService;

    /**
     * 给角色分配菜单(权限)
     */
    @SaCheckPermission("system:role:menu")
    @Log(title = "角色管理", businessType = "给角色分配权限")
    @PostMapping("/assignMenu")
    public Result<Boolean> assignMenu(@RequestBody RoleMenuDTO dto) {
        roleService.assignMenus(dto);
        return Result.success(true);
    }


    /**
     * 分页查询用户列表
     * GET /system/user/list?page=1&size=10&username=admin
     */
    @SaCheckPermission("system:role:list")
    @GetMapping("/list")
    public Result<IPage<SysRole>> getUserList(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String roleName) {

        // 1. 构造分页对象
        Page<SysRole> pageParam = new Page<>(page, size);

        // 2. 构造查询条件
        LambdaQueryWrapper<SysRole> wrapper = new LambdaQueryWrapper<>();
        // 如果前端传了 username，就进行模糊查询 (like)
        // StringUtils.hasText() 检查字符串不为 null 且不为空白
        wrapper.like(StringUtils.hasText(roleName), SysRole::getRoleName, roleName);
        // 按创建时间倒序排，新用户在最上面
        wrapper.orderByDesc(SysRole::getCreateTime);

        // 3. 执行查询
        IPage<SysRole> result = roleService.page(pageParam, wrapper);

        return Result.success(result);
    }

    /**
     * 新增角色
     */
    @SaCheckPermission("system:role:add")
    @Log(title = "角色管理", businessType = "添加角色")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody SysRole user) {
        roleService.saveRole(user);
        return Result.success(true);
    }

    /**
     * 修改角色
     */
    @SaCheckPermission("system:role:edit")
    @Log(title = "角色管理", businessType = "修改角色")
    @PutMapping("/edit")
    public Result<Boolean> edit(@RequestBody SysRole user) {
        roleService.saveRole(user);
        return Result.success(true);
    }

    /**
     * 批量删除角色
     * @param ids ID列表 [1, 2, 3]
     */
    @SaCheckPermission("system:role:delete")
    @Log(title = "角色管理", businessType = "删除角色")
    @DeleteMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        roleService.removeBatchByIds(ids);
        return Result.success(true);
    }

    /**
     * 获取角色列表 (用于下拉框选择)
     */
    @GetMapping("/list/options")
    public Result<List<SysRole>> getRoleOptions() {
        // 只查启用的角色
        return Result.success(roleService.list());
    }

    /**
     * 获取角色已分配的菜单ID列表 (用于回显)
     */
    @GetMapping("/menus/{roleId}")
    public Result<List<Long>> getRoleMenuIds(@PathVariable Long roleId) {
        List<Long> menuIds = roleMenuService.list(new LambdaQueryWrapper<SysRoleMenu>()
                        .eq(SysRoleMenu::getRoleId, roleId))
                .stream().map(SysRoleMenu::getMenuId).collect(Collectors.toList());
        return Result.success(menuIds);
    }

}
