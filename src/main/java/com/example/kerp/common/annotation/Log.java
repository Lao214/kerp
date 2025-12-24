package com.example.kerp.common.annotation;

/*
 *@title Log
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 17:13
 */


import java.lang.annotation.*;

@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /** 模块 */
    String title() default "";

    /** 功能 */
    String businessType() default "";

    /** 是否保存请求数据 */
    boolean isSaveRequestData() default true;
}
