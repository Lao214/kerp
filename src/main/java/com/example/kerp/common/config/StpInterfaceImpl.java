package com.example.kerp.common.config;

/*
 *@title StpInterfaceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/4 18:57
 */



import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import com.example.kerp.modules.system.mapper.SysMenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;

/**
 * 自定义权限验证接口扩展
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    @Autowired
    private SysMenuMapper menuMapper;

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        // 1. 获取当前会话的 Session
        SaSession session = StpUtil.getSessionByLoginId(loginId);

        // 2. 🔥 尝试从 Session 中取缓存的权限列表
        return session.get("PERMISSION_LIST", () -> {
            // 3. ⚡️ 如果 Session 里没有 (比如缓存过期了)，则执行这个 Lambda 回调查询数据库进行兜底
            System.out.println("-----> 缓存未命中，查询数据库权限: " + loginId);
            Long userId = Long.valueOf(loginId.toString());

            // 这里也可以加上超管判断逻辑
            if (userId == 1) {
                return List.of("*");
            }

            return menuMapper.selectPermsByUserId(userId);
        });
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (暂不需要，留空)
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        // 角色同理，也可以缓存，这里暂时留空
        return null;
    }
}
