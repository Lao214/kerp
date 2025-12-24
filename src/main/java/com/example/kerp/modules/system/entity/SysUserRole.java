package com.example.kerp.modules.system.entity;/*
 *@title SysUserRole
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/5 11:43
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class SysUserRole {
    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    private Long userId;

    private Long roleId;
}
