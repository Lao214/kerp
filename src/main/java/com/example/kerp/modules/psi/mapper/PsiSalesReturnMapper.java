package com.example.kerp.modules.psi.mapper;/*
 *@title BaseProductMapper
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/11/29 14:25
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PsiSalesReturnMapper extends BaseMapper<PsiSalesReturn> {


    IPage<PsiSalesReturn> selectReturnPage(Page<PsiSalesReturn> pageParam, @Param("keyword")  String keyword, @Param("returnId")  Long returnId);
}
