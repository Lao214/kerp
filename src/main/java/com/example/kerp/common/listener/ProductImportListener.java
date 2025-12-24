package com.example.kerp.common.listener;

/*
 *@title ProductImportListener
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/11 19:21
 */

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.example.kerp.modules.basic.dto.ProductExcelDTO;
import com.example.kerp.modules.basic.entity.BaseProduct;
import com.example.kerp.modules.basic.service.impl.BaseProductServiceImpl;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

public class ProductImportListener implements ReadListener<ProductExcelDTO> {

    private static final int BATCH_COUNT = 100; // 每100条存一次库
    private List<BaseProduct> cachedDataList = new ArrayList<>(BATCH_COUNT);

    // Service 不能通过 @Autowired 注入，因为这个 Listener 不是 Spring Bean
    // 必须通过构造函数传进来
    private BaseProductServiceImpl productService;

    public ProductImportListener(BaseProductServiceImpl productService) {
        this.productService = productService;
    }

    @Override
    public void invoke(ProductExcelDTO data, AnalysisContext context) {
        BaseProduct product = new BaseProduct();
        BeanUtils.copyProperties(data, product);
        product.setStatus(1); // 默认上架

        cachedDataList.add(product);

        // 攒够了就存
        if (cachedDataList.size() >= BATCH_COUNT) {
            saveData();
            cachedDataList.clear();
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 最后剩下的也要存
        saveData();
    }

    private void saveData() {
        // 这里的 saveBatch 是 MyBatis-Plus 提供的批量插入
        productService.saveBatch(cachedDataList);
    }
}
