package com.example.kerp.modules.system.service.impl;/*
 *@title SysRoleServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 11:48
 */


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.system.dto.RoleMenuDTO;
import com.example.kerp.modules.system.entity.SysRole;
import com.example.kerp.modules.system.entity.SysRoleMenu;
import com.example.kerp.modules.system.mapper.SysRoleMapper;
import com.example.kerp.modules.system.mapper.SysRoleMenuMapper;
import com.example.kerp.modules.system.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {

    @Autowired
    private SysRoleMenuMapper roleMenuMapper;

    @Transactional(rollbackFor = Exception.class)
    public void assignMenus(RoleMenuDTO dto) {
        // 1. 先删掉该角色原本的所有菜单权限
        roleMenuMapper.delete(new LambdaQueryWrapper<SysRoleMenu>()
                .eq(SysRoleMenu::getRoleId, dto.getRoleId()));

        // 2. 批量插入新菜单权限
        if (dto.getMenuIds() != null && !dto.getMenuIds().isEmpty()) {
            for (Long menuId : dto.getMenuIds()) {
                SysRoleMenu relation = new SysRoleMenu();
                relation.setRoleId(dto.getRoleId());
                relation.setMenuId(menuId);
                roleMenuMapper.insert(relation);
            }
        }
        // 角色权限变了，为了安全，原则上应该把拥有该角色的用户都踢下线，或者等待缓存过期
    }


    /**
     * 新增或修改用户
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean saveRole(SysRole role) {
        // 1. 校验用户名是否重复
        LambdaQueryWrapper<SysRole> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysRole::getRoleName, role.getRoleName());

        // 重点：确保 ID 存在且不为空字符串时，才进行排除
        // (前端传过来的 ID 即使是 String，Jackson 转回来也是 Long，没问题)
        if (role.getId() != null) {
            wrapper.ne(SysRole::getId, role.getId());
        }

        // Bro，这里加个日志，万一报错了方便看是不是 ID 对不上
        // System.out.println("正在校验用户: " + user.getUsername() + ", 排除ID: " + user.getId());

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("角色名已存在，换一个吧！");
        }

        return this.saveOrUpdate(role);
    }

    @Override
    public List<String> getRoleCodesByUserId(long loginIdAsLong) {

        return baseMapper.getRoleCodesByUserId(loginIdAsLong);
    }
}
