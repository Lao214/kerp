package com.example.kerp.modules.system.service.impl;/*
 *@title LogAsyncServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 18:42
 */

import com.example.kerp.modules.system.entity.SysOperLog;
import com.example.kerp.modules.system.mapper.SysOperLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class LogAsyncServiceImpl {

    @Autowired
    private SysOperLogMapper logMapper;

    @Async
    public void recordOperLog(SysOperLog operLog) {
        logMapper.insert(operLog);
    }
}

