package com.example.kerp.modules.system.entity;/*
 *@title SysRole
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 18:37
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_role")
public class SysRole {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    private String roleName;

    private String roleCode;

    private String description;

    private String dataScope;

    /**
     * 创建时间
     * 对应数据库 create_time
     */
    private LocalDateTime createTime;

}
