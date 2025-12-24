package com.example.kerp.modules.finance.service.impl;
/*
 *@title FinPaymentServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/9 11:02
 */

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.service.BaseSupplierService;
import com.example.kerp.modules.finance.entity.FinPayment;
import com.example.kerp.modules.finance.mapper.FinPaymentMapper;
import com.example.kerp.modules.finance.service.FinPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FinPaymentServiceImpl extends ServiceImpl<FinPaymentMapper , FinPayment> implements FinPaymentService {

    @Autowired
    private BaseSupplierService supplierService;

    // 保存付款单
    public boolean savePayment(FinPayment receipt) {
        if (receipt.getId() == null) {
            // 生成单号 RC + 时间戳
            receipt.setPaymentNo("PY" + System.currentTimeMillis());
            receipt.setStatus(0); // 草稿
        }
        return this.saveOrUpdate(receipt);
    }

    // 保存和审核逻辑同上，只是方向相反
    @Transactional(rollbackFor = Exception.class)
    public void audit(Long id) {
        FinPayment payment = this.getById(id);
        if (payment.getStatus() != 0) return;

        // 🔥 核心逻辑：供应商欠款减少 (传入负数)
        // 我付了钱，我欠别人的就少了
        supplierService.updatePayableBalance(payment.getSupplierId(), payment.getAmount().negate());

        payment.setStatus(1);
        this.updateById(payment);
    }
}
