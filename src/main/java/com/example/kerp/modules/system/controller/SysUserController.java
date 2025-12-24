package com.example.kerp.modules.system.controller;/*
 *@title SysUserController
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
import com.example.kerp.modules.system.dto.UserRoleDTO;
import com.example.kerp.modules.system.entity.SysUser;
import com.example.kerp.modules.system.entity.SysUserRole;
import com.example.kerp.modules.system.service.SysUserRoleService;
import com.example.kerp.modules.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils; // 注意引入的是 Spring 的 StringUtils
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/system/user")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 分页查询用户列表
     * GET /system/user/list?page=1&size=10&username=admin
     */
    @SaCheckPermission("system:user:list")
    @GetMapping("/list")
    public Result<IPage<SysUser>> getUserList(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size,
            @RequestParam(required = false) String username) {

        // 1. 构造分页对象
        Page<SysUser> pageParam = new Page<>(page, size);

        // 2. 构造查询条件
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        // 如果前端传了 username，就进行模糊查询 (like)
        // StringUtils.hasText() 检查字符串不为 null 且不为空白
        wrapper.like(StringUtils.hasText(username), SysUser::getUsername, username);
        // 按创建时间倒序排，新用户在最上面
        wrapper.orderByDesc(SysUser::getCreateTime);

        // 3. 执行查询
        IPage<SysUser> result = sysUserService.page(pageParam, wrapper);

        // 4. 为了安全，把密码擦除，别传给前端
        result.getRecords().forEach(u -> u.setPassword(null));

        return Result.success(result);
    }

    /**
     * 新增用户
     */
    @Log(title = "用户管理", businessType = "新增用户")
    @SaCheckPermission("system:user:add")
    @PostMapping("/add")
    public Result<Boolean> add(@RequestBody SysUser user) {
        sysUserService.saveUser(user);
        return Result.success(true);
    }

    /**
     * 修改用户
     */
    @SaCheckPermission("system:user:edit")
    @PutMapping("/edit")
    @Log(title = "用户管理", businessType = "修改用户")
    public Result<Boolean> edit(@RequestBody SysUser user) {
        sysUserService.saveUser(user);
        return Result.success(true);
    }

    /**
     * 批量删除用户
     * @param ids ID列表 [1, 2, 3]
     */
    @SaCheckPermission("system:user:edit")
    @DeleteMapping("/delete/{ids}")
    @Log(title = "用户管理", businessType = "删除用户")
    public Result<Boolean> delete(@PathVariable List<Long> ids) {
        sysUserService.removeBatchByIds(ids);
        return Result.success(true);
    }

    /**
     * 给用户分配角色
     */
    @SaCheckPermission("system:user:role") // 需要特定权限
    @Log(title = "用户管理", businessType = "给用户分配角色")
    @PostMapping("/assignRole")
    public Result<Boolean> assignRole(@RequestBody UserRoleDTO dto) {
        sysUserService.assignRoles(dto);
        return Result.success(true);
    }

    /**
     * 获取用户已分配的角色ID列表 (用于回显)
     */
    @GetMapping("/roles/{userId}")
    public Result<List<Long>> getUserRoleIds(@PathVariable Long userId) {
        List<Long> roleIds = sysUserRoleService.list(new LambdaQueryWrapper<SysUserRole>()
                        .eq(SysUserRole::getUserId, userId))
                .stream().map(SysUserRole::getRoleId).collect(Collectors.toList());
        return Result.success(roleIds);
    }
}
