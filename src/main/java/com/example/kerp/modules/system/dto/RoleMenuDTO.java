package com.example.kerp.modules.system.dto;
/*
 *@title RoleMenuDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 11:28
 */

import lombok.Data;

import java.util.List;

@Data
public class RoleMenuDTO {
    private Long roleId;
    private List<Long> menuIds; // 菜单ID列表
}