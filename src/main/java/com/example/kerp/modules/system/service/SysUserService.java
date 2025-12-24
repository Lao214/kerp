package com.example.kerp.modules.system.service;/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.system.dto.LoginDTO;
import com.example.kerp.modules.system.dto.UserRoleDTO;
import com.example.kerp.modules.system.entity.SysUser;

public interface SysUserService extends IService<SysUser> {
    /**
     * 登录业务
     * @param loginDTO 登录参数
     * @return 登录成功的 Token
     */
    String login(LoginDTO loginDTO);

    boolean saveUser(SysUser user);


    void assignRoles(UserRoleDTO dto);
}