package com.example.kerp.modules.system.mapper;
/*
 *@title SysMenuMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 18:47
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.system.entity.SysMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    // 根据用户ID查询所有权限字符串
    List<String> selectPermsByUserId(Long userId);
}
