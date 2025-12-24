package com.example.kerp.modules.system.entity;/*
 *@title SysMenu
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 18:40
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_menu")
public class SysMenu {

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    private Long parentId;

    private String menuName;

    private String path;

    private String component;

    private String perms;

    private String icon;

    private Integer type;

    private Integer sortOrder;

    /**
     * 创建时间
     * 对应数据库 create_time
     */
    private LocalDateTime createTime;

    @TableField(exist = false)
    private List<SysMenu> children;
}
