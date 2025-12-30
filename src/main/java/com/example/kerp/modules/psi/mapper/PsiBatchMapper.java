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
import com.example.kerp.modules.psi.entity.PsiBatch;
import com.example.kerp.modules.psi.entity.PsiInventory;
import com.example.kerp.modules.psi.vo.InventoryVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PsiBatchMapper extends BaseMapper<PsiBatch> {
    /**
     * 自定义多表关联分页查询
     * @param page 分页参数
     * @param keyword 搜索关键字 (商品名称/编码)
     * @param warehouseId 仓库筛选
     */
    IPage<InventoryVO> selectInventoryPage(Page<InventoryVO> page,
                                           @Param("keyword") String keyword,
                                           @Param("warehouseId") Long warehouseId);

}
