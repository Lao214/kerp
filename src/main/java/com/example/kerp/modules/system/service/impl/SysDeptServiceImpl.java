package com.example.kerp.modules.system.service.impl;

/*
 *@title SysDeptServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/16 15:59
 */

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.system.entity.SysDept;
import com.example.kerp.modules.system.mapper.SysDeptMapper;
import com.example.kerp.modules.system.service.SysDeptService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    /**
     * 获取部门树
     */
    public List<SysDept> getDeptTree() {
        // 1. 查出所有未删除的部门，按排序号排好
        List<SysDept> allDepts = this.list(new LambdaQueryWrapper<SysDept>()
                .orderByAsc(SysDept::getOrderNum));

        // 2. 构建树 (Stream流写法，找根节点 parentId=0)
        List<SysDept> tree = allDepts.stream()
                .filter(dept -> dept.getParentId() == 0)
                .map(dept -> {
                    dept.setChildren(getChildren(dept, allDepts));
                    return dept;
                }).collect(Collectors.toList());

        return tree;
    }

    // 递归找子节点
    private List<SysDept> getChildren(SysDept root, List<SysDept> all) {
        List<SysDept> children = all.stream()
                .filter(dept -> dept.getParentId().equals(root.getId()))
                .map(dept -> {
                    dept.setChildren(getChildren(dept, all));
                    return dept;
                }).collect(Collectors.toList());
        return children.isEmpty() ? null : children;
    }
}
