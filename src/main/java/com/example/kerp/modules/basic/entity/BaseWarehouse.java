package com.example.kerp.modules.basic.entity;/*
 *@title BaseWarehouse
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 16:03
 */

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("base_warehouse")
public class BaseWarehouse extends BaseEntity {
    private String code;
    private String name;
    private String location;
    private String manager;
    private Integer status;
    private String remark;
}
