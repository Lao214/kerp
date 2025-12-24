package com.example.kerp.common.aspect;

/*
 *@title LogAspect
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 17:16
 */


import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.IdUtil; // 确保有 Hutool
import cn.hutool.json.JSONUtil;
import com.example.kerp.common.annotation.Log;
import com.example.kerp.modules.system.entity.SysOperLog;
import com.example.kerp.modules.system.mapper.SysOperLogMapper;
import com.example.kerp.modules.system.service.impl.LogAsyncServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.time.LocalDateTime;

@Aspect
@Component
public class LogAspect {

    @Autowired
    private SysOperLogMapper logMapper;

    @Autowired
    private LogAsyncServiceImpl logAsyncService;

    /**
     * 处理完请求后执行
     */
    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "jsonResult")
    public void doAfterReturning(JoinPoint joinPoint, Log controllerLog, Object jsonResult) {
        handleLog(joinPoint, controllerLog, null, jsonResult);
    }

    /**
     * 拦截异常操作
     */
    @AfterThrowing(value = "@annotation(controllerLog)", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Log controllerLog, Exception e) {
        handleLog(joinPoint, controllerLog, e, null);
    }

    protected void handleLog(final JoinPoint joinPoint, Log controllerLog, final Exception e, Object jsonResult) {
        try {
            // 获取当前请求
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();

            // 1. 创建日志对象
            SysOperLog operLog = new SysOperLog();
            operLog.setId(IdUtil.getSnowflakeNextId()); // 生成ID
            operLog.setStatus(0);
            operLog.setOperUrl(request.getRequestURI());
            operLog.setOperIp(request.getRemoteAddr());

            // 2. 获取当前操作人
            try {
                // 如果未登录可能会报错，catch住
                operLog.setOperName(StpUtil.getLoginIdAsString());
            } catch (Exception ignored) {
                operLog.setOperName("未知用户");
            }

            if (e != null) {
                operLog.setStatus(1); // 异常
                operLog.setErrorMsg(e.getMessage());
            }

            // 3. 处理注解上的参数
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            operLog.setTitle(controllerLog.title());
            operLog.setBusinessType(controllerLog.businessType());

            // 4. 保存请求参数 (如果是 POST/PUT)
            if (controllerLog.isSaveRequestData()) {
                // 简单粗暴把参数转JSON，实际项目要过滤掉文件流等
                Object[] args = joinPoint.getArgs();
                if (args != null && args.length > 0) {
                    // 这里的 args[0] 通常是 DTO
                    operLog.setOperParam(JSONUtil.toJsonStr(args[0]));
                }
            }

            operLog.setOperTime(LocalDateTime.now());

            // 5. 存库 (建议这里用 @Async 异步，或者扔线程池，防止卡顿业务)
            //logMapper.insert(operLog);

            // ⭐⭐⭐ 最关键
            logAsyncService.recordOperLog(operLog);

        } catch (Exception exp) {
            // 记录日志失败不要影响业务
            exp.printStackTrace();
        }
    }
}


//        | 方法                | 优点            | 缺点               |
//        | --------------     | ---------       | ---------------- |
//        | @Async             | 最简单、侵入性小   | 并发量太大时线程数有限制     |
//        | 自定义线程池         | 性能更高、可控    | 需要多写几行代码         |
//        | MQ（如 RabbitMQ）   | 最高性能、完全解耦 | 要依赖消息队列、中型以上项目使用 |
