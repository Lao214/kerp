package com.example.kerp.modules.system.mapper;/*
 *@title SysRoleMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 11:49
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.system.entity.SysRole;
import com.example.kerp.modules.system.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {
}
