package com.example.kerp.modules.psi.service;/*
 *@title PsiInventoryService
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 16:48
 */

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.kerp.modules.psi.entity.PsiInventory;
import com.example.kerp.modules.psi.entity.PsiSalesReturnItem;
import com.example.kerp.modules.psi.entity.PurchaseOrderItem;
import com.example.kerp.modules.psi.vo.InventoryVO;

public interface PsiInventoryService extends IService<PsiInventory> {

    public void increaseStock(Long warehouseId, Long productId, Integer quantity);

    public void increaseStockComplex(Long warehouseId, PurchaseOrderItem item, String orderNo);

    public void decreaseStock(Long warehouseId, Long productId, Integer quantity);

    // 👇 新增查询接口
    IPage<InventoryVO> getInventoryPage(Integer page, Integer size, String keyword, Long warehouseId);

    void salesReturnStock(Long warehouseId, PsiSalesReturnItem item, String returnNo);
}
