package com.example.kerp.common.exception;/*
 *@title GlobalExceptionHandler
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 19:01
 */

import cn.dev33.satoken.exception.NotPermissionException;
import com.example.kerp.common.api.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;



public class GlobalExceptionHandler {
    @ExceptionHandler(NotPermissionException.class)
    public Result<String> handleNotPermissionException(NotPermissionException e) {
        return Result.error(403, "Bro，你没有权限进行此操作！(需要权限: " + e.getCode() + ")");
    }
}