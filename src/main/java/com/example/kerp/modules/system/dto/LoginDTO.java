package com.example.kerp.modules.system.dto;/*
 *@title LoginDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:30
 */

import lombok.Data;
import jakarta.validation.constraints.NotBlank; // 如果爆红，看下面提示

/**
 * 登录表单对象
 * DTO = Data Transfer Object (数据传输对象)
 */
@Data
public class LoginDTO {

    @NotBlank(message = "用户名不能为空")
    private String username;

    @NotBlank(message = "密码不能为空")
    private String password;
}