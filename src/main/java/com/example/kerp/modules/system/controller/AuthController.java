package com.example.kerp.modules.system.controller;/*
 *@title AuthController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 15:02
 */


import cn.dev33.satoken.stp.StpUtil;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.system.dto.LoginDTO;
import com.example.kerp.modules.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private SysUserService userService;

    /**
     * 登录接口
     * POST /auth/login
     */
    @PostMapping("/login")
    public Result<String> login(@Validated @RequestBody LoginDTO loginDTO) {
        try {
            String token = userService.login(loginDTO);
            return Result.success(token);
        } catch (Exception e) {
            return Result.error(500, e.getMessage());
        }
    }

    @GetMapping("/info")
    public Result<Map<String, Object>> getInfo() {
        long userId = StpUtil.getLoginIdAsLong();
        // 查询 permissions
        List<String> perms = (List<String>) StpUtil.getSession().get("PERMISSION_LIST");

        Map<String, Object> map = new HashMap<>();
        map.put("permissions",  perms);
        map.put("user", userService.getById(userId)); // 也可以把用户信息带回去
        return Result.success(map);
    }
}
