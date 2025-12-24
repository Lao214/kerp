package com.example.kerp.modules.psi.mapper;/*
 *@title BaseProductMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:25
 */

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.example.kerp.common.annotation.DataScope;
import com.example.kerp.modules.psi.entity.SalesOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SalesOrderMapper extends BaseMapper<SalesOrder> {

    /**
     * 🔥 专家级写法：自定义带权限的分页查询
     * 1. 不 Override，改名叫 selectPageScope，避免 Java 泛型冲突
     * 2. 使用 @Select 注解，配合 ${ew.customSqlSegment} 保留 MP 的动态条件能力
     * 3. 加上 @DataScope 注解，触发拦截器
     */
    @DataScope(userAlias = "t") // 给表起个别名 t
    @Select("SELECT t.* FROM psi_sales_order t ${ew.customSqlSegment}")
    IPage<SalesOrder> selectPageScope(IPage<SalesOrder> page, @Param(Constants.WRAPPER) Wrapper<SalesOrder> queryWrapper);
}
