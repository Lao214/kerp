package com.example.kerp.modules.system.controller;
/*
 *@title FlowController
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/19 16:01
 */

import cn.dev33.satoken.stp.StpUtil;
import com.example.kerp.common.api.Result;
import com.example.kerp.modules.system.service.SysRoleService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/flow")
public class FlowController {

    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private SysRoleService roleService;

    /**
     * 1. 查询【我的待办】任务
     */
    @GetMapping("/tasks")
    public Result<List<Map<String, Object>>> myTasks() {
        // 获取当前用户的角色列表 (假设存Session了，或者现场查)
        // 这里简单模拟：假设当前登录的是 purchase_mgr
        // 实际开发：List<String> groups = roleService.getRoleCodesByUserId(StpUtil.getLoginIdAsLong());
        List<String> groups = roleService.getRoleCodesByUserId(StpUtil.getLoginIdAsLong());
        // List<String> groups = new ArrayList<>();
        // 为了测试，你可以硬编码：如果你是 admin，就假装你有 purchase_mgr 权限
        //groups.add("purchase_mgr");
        //groups.add("boss");

        // 查询分配给这些角色的任务
        List<Task> tasks = taskService.createTaskQuery()
                .taskCandidateGroupIn(groups)
                .list();

        // 转成 Map 返回给前端
        List<Map<String, Object>> list = new ArrayList<>();
        for (Task task : tasks) {
            Map<String, Object> map = new HashMap<>();
            map.put("taskId", task.getId());
            map.put("taskName", task.getName());
            map.put("createTime", task.getCreateTime());
            // 关联的业务ID (采购单ID)
            // 需要通过 runtimeService 查流程实例拿到 BusinessKey
            String processInstanceId = task.getProcessInstanceId();
            String businessKey = runtimeService.createProcessInstanceQuery()
                    .processInstanceId(processInstanceId)
                    .singleResult().getBusinessKey();
            map.put("orderId", businessKey);
            list.add(map);
        }
        return Result.success(list);
    }

    /**
     * 2. 审批通过 (完成任务)
     */
    @PostMapping("/complete/{taskId}")
    public Result<Boolean> complete(@PathVariable String taskId) {
        taskService.complete(taskId);
        return Result.success(true);
    }
}