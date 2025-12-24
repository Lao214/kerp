package com.example.kerp.modules.system.service;
/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.system.dto.RoleMenuDTO;
import com.example.kerp.modules.system.entity.SysRole;

import java.util.List;


public interface SysRoleService extends IService<SysRole> {
    void assignMenus(RoleMenuDTO dto);

    boolean saveRole(SysRole user);

    List<String> getRoleCodesByUserId(long loginIdAsLong);
}