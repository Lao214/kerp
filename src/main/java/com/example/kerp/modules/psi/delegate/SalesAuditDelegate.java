package com.example.kerp.modules.psi.delegate;/*
 *@title SaleAuditDelegate
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/30 10:34
 */


import com.example.kerp.modules.psi.service.SalesOrderService;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.delegate.JavaDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("salesAuditDelegate") // 对应 BPMN 里的 delegateExpression
public class SalesAuditDelegate implements JavaDelegate {

    @Autowired
    private SalesOrderService salesService;

    @Override
    public void execute(DelegateExecution execution) {
        // 1. 获取业务Key (SalesOrder ID)
        String orderIdStr = execution.getProcessInstanceBusinessKey();
        Long orderId = Long.parseLong(orderIdStr);

        System.out.println("🤖 [Flowable] 销售审批通过，执行自动出库，单号ID: " + orderId);

        // 2. 调用原有的审核逻辑 (扣库存、加应收)
        salesService.audit(orderId);
    }
}