package com.example.kerp.modules.system.service.impl;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.example.kerp.modules.system.dto.LoginDTO;
import com.example.kerp.modules.system.dto.RoleMenuDTO;
import com.example.kerp.modules.system.dto.UserRoleDTO;
import com.example.kerp.modules.system.entity.SysRole;
import com.example.kerp.modules.system.entity.SysRoleMenu;
import com.example.kerp.modules.system.entity.SysUser;
import com.example.kerp.modules.system.entity.SysUserRole;
import com.example.kerp.modules.system.mapper.*;
import com.example.kerp.modules.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// ... 之前的 import
import org.springframework.transaction.annotation.Transactional; // 开启事务

import java.util.ArrayList;
import java.util.List;

@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    // 注入中间表的 Mapper (你需要自己创建 SysUserRoleMapper 和 SysRoleMenuMapper)
    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysMenuMapper menuMapper;

    @Transactional(rollbackFor = Exception.class)
    public void assignRoles(UserRoleDTO dto) {
        // 1. 先删掉该用户原本的所有角色
        userRoleMapper.delete(new LambdaQueryWrapper<SysUserRole>()
                .eq(SysUserRole::getUserId, dto.getUserId()));

        // 2. 批量插入新角色
        if (dto.getRoleIds() != null && !dto.getRoleIds().isEmpty()) {
            List<SysUserRole> relations = new ArrayList<>();
            for (Long roleId : dto.getRoleIds()) {
                SysUserRole relation = new SysUserRole();
                relation.setUserId(dto.getUserId());
                relation.setRoleId(roleId);
                relations.add(relation);
            }
            userRoleMapper.insert(relations);
        }

        // 🔥 方案 A：直接踢下线 (最安全，用户需要重新登录)
        StpUtil.kickout(dto.getUserId());

        // 🔥 方案 B：只清理 Session，不踢人 (用户体验好，下次访问自动重查库)
        // StpUtil.getSessionByLoginId(dto.getUserId()).delete("PERMISSION_LIST");
    }

    /**
     * 重构后的登录逻辑
     */
    @Override
    public String login(LoginDTO loginDTO) {
        // 1. 查用户
        SysUser user = this.getOne(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getUsername, loginDTO.getUsername()));

        if (user == null) {
            throw new RuntimeException("用户不存在");
        }

        // 2. ⚡️ BCrypt 验密 (将明文和数据库的密文比对)
        if (!BCrypt.checkpw(loginDTO.getPassword(), user.getPassword())) {
            throw new RuntimeException("密码错误");
        }

        if (user.getStatus() == 0) {
            throw new RuntimeException("账号已被禁用");
        }

        // 3. ⚡️ Sa-Token 登录
        // 这行代码执行后，Sa-Token 会自动生成 Token 并注入上下文
        StpUtil.login(user.getId());

        // ============ 🔥 重点来了：把权限塞给 Sa-Token 缓存 ============

        // 🔥🔥🔥 核心新增：缓存用户的 角色数据权限 和 部门ID 🔥🔥🔥

        // 3.1 查出用户的主角色 (为了简单，这里假设用户只有一个主角色，或者取权限最大的那个)
        // 实际场景：SELECT * FROM sys_role r JOIN sys_user_role ur ON r.id = ur.role_id WHERE ur.user_id = ?
        // 这里我模拟一下查询逻辑，你需要写对应的 Mapper
        SysRole role = roleMapper.selectMainRoleByUserId(user.getId());

        if (role != null) {
            StpUtil.getSession().set("DATA_SCOPE", role.getDataScope());
        } else {
            // 没角色默认只能看自己
            StpUtil.getSession().set("DATA_SCOPE", 3);
        }

        // 3.2 缓存部门ID
        StpUtil.getSession().set("DEPT_ID", user.getDeptId());

        // 3.3 查出该用户的所有权限列表 (调用之前写好的 Mapper)
        // 注意：如果是超管，这里直接手动给一个List.of("*")，或者在 SQL 里处理
        List<String> permissionList;
        if ("admin".equals(user.getUsername())) { // 简单判断超管
            permissionList = List.of("*");
        } else {
            permissionList = menuMapper.selectPermsByUserId(user.getId());
        }

        // 3.4 塞入 Session
        // "PERMISSION_LIST" 是我们自定义的一个 Key
        StpUtil.getSession().set("PERMISSION_LIST", permissionList);

        // ==========================================================

        // 4. 获取 Token 返回
        return StpUtil.getTokenInfo().tokenValue;
    }


    /**
     * 新增或修改用户
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean saveUser(SysUser user) {
        // 1. 校验用户名是否重复
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getUsername, user.getUsername());

        // 重点：确保 ID 存在且不为空字符串时，才进行排除
        // (前端传过来的 ID 即使是 String，Jackson 转回来也是 Long，没问题)
        if (user.getId() != null) {
            wrapper.ne(SysUser::getId, user.getId());
        }

        // Bro，这里加个日志，万一报错了方便看是不是 ID 对不上
        // System.out.println("正在校验用户: " + user.getUsername() + ", 排除ID: " + user.getId());

        if (this.count(wrapper) > 0) {
            throw new RuntimeException("用户名已存在，换一个吧！");
        }

        // 2. 处理密码
        if (user.getId() == null) {
            // 新增时：设置初始密码并加密
            // ⚡️ 必须加密存储！
            String rawPassword = "123456";
            user.setPassword(BCrypt.hashpw(rawPassword));
            user.setStatus(1);
        } else {
            // 修改时：如果前端传了 password，说明要重置密码
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                user.setPassword(BCrypt.hashpw(user.getPassword()));
            } else {
                user.setPassword(null); // 保持原密码
            }
        }

        return this.saveOrUpdate(user);
    }
}