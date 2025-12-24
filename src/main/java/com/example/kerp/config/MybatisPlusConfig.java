package com.example.kerp.config;/*
 *@title MybatisPlusConfig
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 10:14
 */

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.example.kerp.common.config.DataScopeInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MybatisPlusConfig {

    @Autowired
    private DataScopeInterceptor dataScopeInterceptor;


    /**
     * 添加分页插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 1. 先加数据权限拦截器 (顺序很重要！)
        interceptor.addInnerInterceptor(dataScopeInterceptor);
        // 2. 再加分页插件
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }
}