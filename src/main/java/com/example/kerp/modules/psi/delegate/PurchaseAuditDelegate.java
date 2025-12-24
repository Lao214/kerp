package com.example.kerp.modules.psi.delegate;
/*
 *@title PurchaseAuditDelegate
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/19 15:49
 */

import com.example.kerp.modules.psi.service.PurchaseOrderService;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.delegate.JavaDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 流程结束后的自动执行类
 */
@Component("purchaseAuditDelegate") // 这里的名字要和 xml 里的 delegateExpression 一致
public class PurchaseAuditDelegate implements JavaDelegate {

    @Autowired
    private PurchaseOrderService purchaseService;

    @Override
    public void execute(DelegateExecution execution) {
        // 1. 获取关联的业务ID (PurchaseOrder ID)
        // 我们在启动流程时，会把 orderId 存为 processInstanceBusinessKey
        String orderIdStr = execution.getProcessInstanceBusinessKey();
        Long orderId = Long.parseLong(orderIdStr);

        System.out.println("🤖 [Flowable] 审批通过，系统自动执行入库逻辑，OrderID: " + orderId);

        // 2. 调用原有的 Service 逻辑 (修改状态、加库存、加应付)
        // 注意：原 audit 方法里有 check status=0，流程里已经是审批中了，
        // 建议在 Service 里拆分一个 forceAudit 方法，或者这里先改状态再调
        purchaseService.audit(orderId);
    }
}
