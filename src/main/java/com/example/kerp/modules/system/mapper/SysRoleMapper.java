package com.example.kerp.modules.system.mapper;/*
 *@title SysRoleMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 11:49
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.system.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {
    SysRole selectMainRoleByUserId(@Param("id") Long id);

    List<String> getRoleCodesByUserId(@Param("userId") long userId);
}
