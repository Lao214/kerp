package com.example.kerp.modules.psi.dto;/*
 *@title SalesReturnDTO
 *@description
 *@author echoes
 *@version 1.0
 *@create 2026/1/4 14:43
 */

import com.example.kerp.modules.psi.entity.PsiSalesReturn;
import com.example.kerp.modules.psi.entity.PsiSalesReturnItem;
import lombok.Data;

import java.util.List;

@Data
public class SalesReturnDTO  extends PsiSalesReturn {


    private List<PsiSalesReturnItem> items;
}
