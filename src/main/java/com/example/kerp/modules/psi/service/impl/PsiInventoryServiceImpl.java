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
import com.example.kerp.modules.psi.entity.PsiInventory;
import com.example.kerp.modules.psi.mapper.PsiInventoryMapper;
import com.example.kerp.modules.psi.service.PsiInventoryService;
import com.example.kerp.modules.psi.vo.InventoryVO;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.TimeUnit;

@Service
public class PsiInventoryServiceImpl extends ServiceImpl<PsiInventoryMapper, PsiInventory> implements PsiInventoryService {


    @Autowired
    private RedissonClient redissonClient;

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

}
