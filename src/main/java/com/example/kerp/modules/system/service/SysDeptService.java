package com.example.kerp.modules.system.service;
/*
 *@title SysUserService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/28 14:31
 */


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.system.entity.SysDept;

import java.util.List;


public interface SysDeptService extends IService<SysDept> {

    /**
     * 获取部门树
     */
    public List<SysDept> getDeptTree();

}