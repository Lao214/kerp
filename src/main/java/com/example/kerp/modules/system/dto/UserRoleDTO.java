package com.example.kerp.modules.system.dto;
/*
 *@title UserRoleDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 20:17
 */

import lombok.Data;

import java.util.List;

@Data
public class UserRoleDTO {
    private Long userId;
    private List<Long> roleIds; // 角色ID列表
}