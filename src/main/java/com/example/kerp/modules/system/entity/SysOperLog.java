package com.example.kerp.modules.system.entity;/*
 *@title SysOperLog
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 17:02
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_oper_log")
public class SysOperLog {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 模块标题
     */
    private String title;

    /**
     * 业务类型
     */
    private String businessType;

    /**
     * 操作人员
     */
    private String operName;

    /**
     * 请求Url
     */
    private String operUrl;

    /**
     * 主机地址
     */
    private String operIp;

    /**
     * 请求参数
     */
    private String operParam;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 错误消息
     */
    private String errorMsg;

    /**
     * 错误消息
     */
    private LocalDateTime operTime;

}
