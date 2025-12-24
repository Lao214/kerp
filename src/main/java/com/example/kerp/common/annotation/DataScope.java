package com.example.kerp.common.annotation;/*
 *@title DataScope
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/12 17:22
 */

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataScope {
    /**
     * 部门表的别名 (例如 SQL 中: select * from sys_dept d，别名就是 d)
     */
    String deptAlias() default "";

    /**
     * 用户表的别名 (例如 SQL 中: select * from sys_user u，别名就是 u)
     */
    String userAlias() default "";
}