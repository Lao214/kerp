package com.example.kerp.config;
/*
 *@title SaTokenConfigure
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 20:12
 */

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器，定义在执行目标方法前先进行登录验证
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns("/**")        // 拦截所有路由
                .excludePathPatterns("/auth/login") // ⚡️ 放行登录接口
                .excludePathPatterns("/doc.html", "/webjars/**", "/v3/api-docs/**"); // 放行 Swagger (如果有的话)
    }
}