package com.example.kerp.common.config;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.PluginUtils;
import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;

import com.example.kerp.common.annotation.DataScope;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field; // 👈 记得引入这个
import java.lang.reflect.Method;
import java.sql.Connection;

/**
 * 数据权限拦截器
 */
@Slf4j
@Component
public class DataScopeInterceptor implements InnerInterceptor {

    @Override
    public void beforePrepare(StatementHandler sh, Connection connection, Integer transactionTimeout) {
        PluginUtils.MPStatementHandler mpSh = PluginUtils.mpStatementHandler(sh);
        MappedStatement ms = mpSh.mappedStatement();
        BoundSql boundSql = mpSh.boundSql();

        // 1. 检查注解
        DataScope dataScope = getDataScopeAnnotation(ms);
        if (dataScope == null) return;

        // 2. 检查登录
        if (!StpUtil.isLogin()) return;

        // 3. 获取 Session 中的缓存数据
        // 使用 Hutool 的 ObjectUtil.defaultIfNull 方法
        Integer scopeType = ObjectUtil.defaultIfNull(StpUtil.getSession().getInt("DATA_SCOPE"), 3);
        Long deptId = ObjectUtil.defaultIfNull(StpUtil.getSession().getLong("DEPT_ID"), -1L);
        Long userId = StpUtil.getLoginIdAsLong();

        // 4. 超级管理员 (admin) 或 数据权限=1 (全部数据)，直接放行，不拼接SQL
        // 假设 admin 角色的 data_scope 已经设为 1 了
        if (scopeType == 1) {
            return;
        }

        // 5. 开始构建过滤 SQL
        String originalSql = boundSql.getSql();
        StringBuilder sqlBuilder = new StringBuilder();

        // 获取注解上的别名 (比如 u.create_by 中的 u)
        String userAlias = dataScope.userAlias();
        String deptAlias = dataScope.deptAlias();

        // 处理别名前缀 (如果有别名，加个点，比如 "u.")
        String uPrefix = userAlias.isEmpty() ? "" : userAlias + ".";
        String dPrefix = deptAlias.isEmpty() ? "" : deptAlias + ".";

        if (scopeType == 2) {
            // ✨ 2: 本部门数据 (AND dept_id = ?)
            // 假设业务表里有 dept_id 字段，或者通过 create_by 关联 user 表查 dept_id
            // 这里演示最简单的：业务表直接有 create_by，我们需要关联 sys_user 查部门
            // 但为了性能，通常业务表会有冗余 dept_id。
            // 假设业务表有 create_by，我们生成: create_by IN (SELECT id FROM sys_user WHERE dept_id = 100)

            // 或者更优方案：业务表冗余 dept_id 字段，直接 AND d.dept_id = 100
            // 这里假设业务表没有 dept_id，只能通过 create_by 找人
            sqlBuilder.append(uPrefix).append("create_by IN (SELECT id FROM sys_user WHERE dept_id = ").append(deptId).append(")");

        } else if (scopeType == 3) {
            // ✨ 3: 仅本人数据 (AND create_by = ?)
            sqlBuilder.append(uPrefix).append("create_by = ").append(userId);
        }

        // 6. 注入 SQL
        if (sqlBuilder.length() > 0) {

            // 🛑 核心修改点：
            // 如果注解里指定了 userAlias (比如 "t")，那外面的表别名就叫 "t"
            // 如果没指定，就叫 "temp_scope"
            // 这样你的 sqlBuilder 里的 "t.create_by" 就能对应上了！

            String alias = userAlias.isEmpty() ? "temp_scope" : userAlias;

            String newSql = "SELECT * FROM (" + originalSql + ") " + alias + " WHERE " + sqlBuilder.toString();

            rewriteSql(boundSql, newSql);
            log.info("🛡️ 动态数据权限[Type={}]生效，SQL: {}", scopeType, newSql);
        }
    }

    /**
     * 🔥 核心黑科技：利用反射修改 BoundSql 的私有字段 sql
     */
    private void rewriteSql(BoundSql boundSql, String newSql) {
        try {
            // 1. 获取 BoundSql 类的 sql 字段
            Field field = boundSql.getClass().getDeclaredField("sql");
            // 2. 破解访问权限
            field.setAccessible(true);
            // 3. 强行赋值
            field.set(boundSql, newSql);
        } catch (Exception e) {
            log.error("数据权限重写SQL失败", e);
            throw new RuntimeException("数据权限拦截异常");
        }
    }

    // 反射获取注解的辅助方法 (保持不变)
    private DataScope getDataScopeAnnotation(MappedStatement ms) {
        try {
            String id = ms.getId();
            String className = id.substring(0, id.lastIndexOf("."));
            String methodName = id.substring(id.lastIndexOf(".") + 1);
            Class<?> clazz = Class.forName(className);
            for (Method method : clazz.getMethods()) {
                if (method.getName().equals(methodName) && method.isAnnotationPresent(DataScope.class)) {
                    return method.getAnnotation(DataScope.class);
                }
            }
        } catch (Exception e) {
            // ignore
        }
        return null;
    }
}