package com.example.kerp.modules.system.entity;/*
 *@title SysDept
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/16 15:57
 */

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dept")
public class SysDept extends BaseEntity {
    private Long parentId;
    private String deptName;
    private Integer orderNum;
    private String leader;
    private String phone;
    private String email;
    private Integer status;

    // ⚡️ 这个字段数据库没有，是用来存子节点的
    @TableField(exist = false)
    private List<SysDept> children;
}