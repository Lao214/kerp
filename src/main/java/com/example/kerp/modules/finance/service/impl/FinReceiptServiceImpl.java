package com.example.kerp.modules.finance.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.service.BaseCustomerService;
import com.example.kerp.modules.finance.entity.FinReceipt;
import com.example.kerp.modules.finance.mapper.FinReceiptMapper;
import com.example.kerp.modules.finance.service.FinReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FinReceiptServiceImpl extends ServiceImpl<FinReceiptMapper, FinReceipt> implements FinReceiptService {

    @Autowired
    private BaseCustomerService customerService;

    // 1. 保存收款单
    @Transactional(rollbackFor = Exception.class)
    public boolean saveReceipt(FinReceipt receipt) {
        // 生成单号 RC + 时间戳
        if (receipt.getId() == null) {
            receipt.setReceiptNo("RC" + System.currentTimeMillis());
            receipt.setStatus(0); // 默认为草稿
        }
        return this.saveOrUpdate(receipt);
    }

    // 2. 审核收款单 (钱进来了)
    @Transactional(rollbackFor = Exception.class)
    public void audit(Long id) {
        FinReceipt receipt = this.getById(id);
        if (receipt == null) throw new RuntimeException("单据不存在");
        if (receipt.getStatus() != 0) throw new RuntimeException("只能审核草稿状态的单据");

        // 🔥 核心逻辑：客户欠款减少 (传入负数)
        // 比如客户欠8万，收了3万。更新余额时传入 -30000。
        // 余额 80000 + (-30000) = 50000。
        customerService.updateReceivableBalance(receipt.getCustomerId(), receipt.getAmount().negate());

        // 更新状态
        receipt.setStatus(1);
        this.updateById(receipt);
    }
}