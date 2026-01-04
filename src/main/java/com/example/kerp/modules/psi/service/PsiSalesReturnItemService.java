package com.example.kerp.modules.psi.service;
/*
 *@title PsiInventoryService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 16:48
*/

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import com.example.kerp.modules.psi.entity.PsiSalesReturnItem;

import java.util.List;

public interface PsiSalesReturnItemService extends IService<PsiSalesReturnItem> {


    List<PsiSalesReturnItem> listByReturnId(Long id);
}
