package com.example.kerp.config;
/*
 *@title SaTokenRedisConfig
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 15:17
 */



import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import cn.dev33.satoken.dao.SaTokenDao;
import cn.dev33.satoken.dao.SaTokenDaoRedisJackson; // 如果爆红，检查依赖版本

/**
 * 确保 Jackson 能序列化/反序列化 Redis 中的数据
 */
@Configuration
public class SaTokenRedisConfig {

    // 如果没有特殊需求，通常不需要写这个类，starter 会自动配置。
    // 只有当你发现存进去的数据取出来是 null 或者报错时，才需要手动配置 ObjectMapper。
}