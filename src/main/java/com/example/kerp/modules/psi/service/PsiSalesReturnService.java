package com.example.kerp.modules.psi.service;
/*
 *@title PsiInventoryService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 16:48
*/

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.dto.SalesReturnDTO;
import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import com.example.kerp.modules.psi.vo.InventoryVO;

import java.util.List;

public interface PsiSalesReturnService extends IService<PsiSalesReturn> {


    IPage<PsiSalesReturn> getReturnPage(Integer page, Integer size, String keyword, Long returnId);

    boolean saveReturn(SalesReturnDTO dto);

    void audit(Long id);

    boolean deleteReturn(List<Long> ids);
}
