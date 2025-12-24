package com.example.kerp.modules.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.kerp.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统用户表
 * 对应数据库 sys_user
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_user")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 用户名 */
    private String username;

    /** 密码 (将来会是 BCrypt 加密后的乱码) */
    private String password;

    /** 真实姓名 */
    private String realName;

    /** 头像 */
    private String avatar;

    /** 状态 (1:正常 0:禁用) */
    private Integer status;

    private Long deptId;

    // id, createTime... 都在父类里了，不用写！
}