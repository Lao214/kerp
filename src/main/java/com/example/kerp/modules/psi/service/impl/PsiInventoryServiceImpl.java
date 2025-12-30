package com.example.kerp.modules.psi.service.impl;
/*
 *@title PsiInventoryServiceImpl
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/2 16:47
 */

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.kerp.modules.basic.entity.BaseProduct;
import com.example.kerp.modules.basic.service.BaseProductService;
import com.example.kerp.modules.psi.entity.*;
import com.example.kerp.modules.psi.mapper.PsiBatchMapper;
import com.example.kerp.modules.psi.mapper.PsiInventoryMapper;
import com.example.kerp.modules.psi.mapper.PsiSerialMapper;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.vo.InventoryVO;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class PsiInventoryServiceImpl extends ServiceImpl<PsiInventoryMapper, PsiInventory> implements PsiInventoryService {


    @Autowired
    private RedissonClient redissonClient;
    @Autowired
    private PsiBatchMapper batchMapper;
    @Autowired
    private PsiSerialMapper serialMapper;
    @Autowired
    private BaseProductService productService;

    /**
     * 增加库存
     * @param warehouseId 仓库ID
     * @param productId 商品ID
     * @param quantity 增加的数量
     */
    @Transactional(rollbackFor = Exception.class)
    public void increaseStock(Long warehouseId, Long productId, Integer quantity) {
        // 1. 先查查这个仓库有没有这个商品
        LambdaQueryWrapper<PsiInventory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(PsiInventory::getWarehouseId, warehouseId)
                .eq(PsiInventory::getProductId, productId);

        PsiInventory inventory = this.getOne(wrapper);

        if (inventory == null) {
            // 2. 如果没有，就初始化一条
            inventory = new PsiInventory();
            inventory.setWarehouseId(warehouseId);
            inventory.setProductId(productId);
            inventory.setStockQuantity(quantity);
            this.save(inventory);
        } else {
            // 3. 如果有，就累加
            // 这里的写法是非原子性的，高并发会有问题。
            // 严谨写法是用 SQL: update psi_inventory set stock_quantity = stock_quantity + ? where id = ?
            // 但对于练手项目，先这样写，逻辑更清晰
            inventory.setStockQuantity(inventory.getStockQuantity() + quantity);
            this.updateById(inventory);
        }
    }

    @Override
    public IPage<InventoryVO> getInventoryPage(Integer page, Integer size, String keyword, Long warehouseId) {
        // 构造分页对象，泛型要是 VO
        Page<InventoryVO> pageParam = new Page<>(page, size);
        // 调用自定义 Mapper
        return baseMapper.selectInventoryPage(pageParam, keyword, warehouseId);
    }


    /**
     * 扣减库存 (出库)
     * @return 扣减成功返回 true
     */
//    @Transactional(rollbackFor = Exception.class)
//    public void decreaseStock(Long warehouseId, Long productId, Integer quantity) {
//        // 1. 查库存
//        LambdaQueryWrapper<PsiInventory> wrapper = new LambdaQueryWrapper<>();
//        wrapper.eq(PsiInventory::getWarehouseId, warehouseId)
//                .eq(PsiInventory::getProductId, productId);
//
//        PsiInventory inventory = this.getOne(wrapper);
//
//        // 2. 校验是否存在
//        if (inventory == null) {
//            throw new RuntimeException("该仓库没有此商品的库存记录，无法出库！");
//        }
//
//        // 3. 校验库存够不够 (Bro，这一步最关键)
//        if (inventory.getStockQuantity() < quantity) {
//            throw new RuntimeException("库存不足！当前库存: " + inventory.getStockQuantity() + ", 拟出库: " + quantity);
//        }
//
//        // 4. 执行扣减
//        // 专家提示：这里还可以加乐观锁版本号 check，防止并发扣减成负数
//        // update set stock = stock - q where id = ? and stock >= q
//        inventory.setStockQuantity(inventory.getStockQuantity() - quantity);
//        this.updateById(inventory);
//    }

    /**
     * 扣减库存 (分布式锁版)
     * 场景：销售出库审核
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void decreaseStock(Long warehouseId, Long productId, Integer quantity) {
        // 1. 定义锁的 Key
        // 锁粒度越细越好：我们只锁“某个仓库的某个商品”，不影响其他商品的出库
        String lockKey = "stock:lock:" + warehouseId + ":" + productId;

        // 2. 获取锁对象
        RLock lock = redissonClient.getLock(lockKey);

        try {
            // 3. 尝试加锁
            // 参数1：等待时间 (3秒拿不到锁就放弃，防止前端等太久)
            // 参数2：自动释放时间 (10秒后自动开锁，防止死锁)
            // 参数3：时间单位
            boolean isLocked = lock.tryLock(3, 10, TimeUnit.SECONDS);

            if (isLocked) {
                // ============ 🔒 进入安全区 ============

                // 4. 查库存 (必须在锁内查，才是最新数据)
                LambdaQueryWrapper<PsiInventory> wrapper = new LambdaQueryWrapper<>();
                wrapper.eq(PsiInventory::getWarehouseId, warehouseId)
                        .eq(PsiInventory::getProductId, productId);
                PsiInventory inventory = this.getOne(wrapper);

                // 5. 校验是否存在
                if (inventory == null) {
                    throw new RuntimeException("该仓库没有此商品的库存记录");
                }

                // 6. 校验库存是否充足 (关键判断)
                if (inventory.getStockQuantity() < quantity) {
                    throw new RuntimeException("库存不足！剩余: " + inventory.getStockQuantity());
                }

                // 7. 执行扣减
                inventory.setStockQuantity(inventory.getStockQuantity() - quantity);
                this.updateById(inventory);

                System.out.println("✅ 库存扣减成功: " + lockKey + " - " + quantity);
                // ============ 🔒 退出安全区 ============
            } else {
                // 获取锁失败
                throw new RuntimeException("系统繁忙(库存抢占中)，请稍后重试");
            }
        } catch (InterruptedException e) {
            throw new RuntimeException("服务器线程中断");
        } finally {
            // 8. 释放锁 (一定要做！并且要判断是不是当前线程加的锁)
            if (lock.isLocked() && lock.isHeldByCurrentThread()) {
                lock.unlock();
            }
        }
    }

    /**
     * 普通商品：随便扣。
     * 批次商品：先进先出 (FIFO)。系统自动找最早过期的批次扣减，或者用户指定批次。
     * SN 商品：用户必须扫码/输入具体的 SN，系统校验该 SN 是否在库。
     * @param warehouseId
     * @param item
     * @param orderNo
     */

    @Transactional(rollbackFor = Exception.class)
    public void decreaseStockComplex(Long warehouseId, SalesOrderItem item, String orderNo) {
        BaseProduct product = productService.getById(item.getProductId());

        // 1. 扣减总库存 (利用之前的 Redisson 锁逻辑)
        this.decreaseStock(warehouseId, item.getProductId(), item.getQuantity());

        // 2. 分流
        if (product.getManageType() == 1) {
            // === 批次 FIFO 自动扣减 ===
            // 查出该商品所有批次，按过期时间/创建时间 升序排列
            List<PsiBatch> batches = batchMapper.selectList(new LambdaQueryWrapper<PsiBatch>()
                    .eq(PsiBatch::getWarehouseId, warehouseId)
                    .eq(PsiBatch::getProductId, item.getProductId())
                    .gt(PsiBatch::getQuantity, 0) // 只要有库存的
                    .orderByAsc(PsiBatch::getExpireDate)); // 🔥 核心：先卖快过期的

            int remainQty = item.getQuantity(); // 还需要扣多少

            for (PsiBatch batch : batches) {
                if (remainQty <= 0) break;

                int deduct = Math.min(batch.getQuantity(), remainQty); // 这次扣多少

                // 更新批次表
                batch.setQuantity(batch.getQuantity() - deduct);
                batchMapper.updateById(batch);

                remainQty -= deduct;
            }

            if (remainQty > 0) {
                throw new RuntimeException("逻辑错误：总库存够，但批次库存对不上！需要盘点！");
            }

        } else if (product.getManageType() == 2) {
            // === 序列号出库 ===
            if (item.getSnList() == null || item.getSnList().size() != item.getQuantity()) {
                throw new RuntimeException("请指定出库的SN序列号");
            }

            for (String sn : item.getSnList()) {
                // 查 SN 状态
                PsiSerial serial = serialMapper.selectOne(new LambdaQueryWrapper<PsiSerial>()
                        .eq(PsiSerial::getSnCode, sn)
                        .eq(PsiSerial::getWarehouseId, warehouseId));

                if (serial == null || serial.getStatus() != 1) {
                    throw new RuntimeException("SN号 " + sn + " 不存在或已出库");
                }

                // 更新状态
                serial.setStatus(2); // 已售
                serial.setOutOrderNo(orderNo); // 记录去向
                serialMapper.updateById(serial);
            }
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void increaseStockComplex(Long warehouseId, PurchaseOrderItem item, String orderNo) {
        // 1. 查商品属性
        BaseProduct product = productService.getById(item.getProductId());

        // 2. 更新总库存 (psi_inventory) —— 无论什么模式，总数都要加
        this.increaseStock(warehouseId, item.getProductId(), item.getQuantity());

        // 3. 分流处理
        if (product.getManageType() == 1) {
            // === 批次管理 ===
            if (item.getBatchNo() == null) throw new RuntimeException("批次商品必须填写批次号");

            // 查该批次是否存在
            PsiBatch batch = batchMapper.selectOne(new LambdaQueryWrapper<PsiBatch>()
                    .eq(PsiBatch::getWarehouseId, warehouseId)
                    .eq(PsiBatch::getProductId, item.getProductId())
                    .eq(PsiBatch::getBatchNo, item.getBatchNo()));

            if (batch == null) {
                // 新批次 -> Insert
                batch = new PsiBatch();
                batch.setWarehouseId(warehouseId);
                batch.setProductId(item.getProductId());
                batch.setBatchNo(item.getBatchNo());
                batch.setExpireDate(item.getExpireDate()); // 记得前端要传
                batch.setQuantity(item.getQuantity());
                batchMapper.insert(batch);
            } else {
                // 老批次 -> Update
                batch.setQuantity(batch.getQuantity() + item.getQuantity());
                batchMapper.updateById(batch);
            }

        } else if (product.getManageType() == 2) {
            // === 序列号管理 (SN) ===

            // ❌ 以前的代码：试图从 item.getSnList() 获取，但现在它是空的
            // ✅ 现在的逻辑：根据【入库单号】去 psi_serial 表里找状态为 0 的记录，全部“转正”

            // update psi_serial set status = 1 where in_order_no = ? and product_id = ? and status = 0

            PsiSerial updateEntity = new PsiSerial();
            updateEntity.setStatus(1); // 变更为“在库”

            serialMapper.update(updateEntity, new LambdaQueryWrapper<PsiSerial>()
                    .eq(PsiSerial::getInOrderNo, orderNo)
                    .eq(PsiSerial::getProductId, item.getProductId())
                    .eq(PsiSerial::getStatus, 0)); // 只更新待入库的

            // 严谨性校验：如果更新的条数 != item.getQuantity()，说明数据对不上，可以抛异常
        }
    }

}
