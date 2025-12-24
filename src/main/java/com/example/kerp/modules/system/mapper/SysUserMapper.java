package com.example.kerp.modules.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.kerp.modules.system.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户表 Mapper 接口
 * 只要继承了 BaseMapper，你就自动拥有了 CRUD 的能力
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    // 暂时啥也不用写，MyBatis-Plus 帮你搞定了一切
}