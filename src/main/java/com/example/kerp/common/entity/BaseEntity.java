package com.example.kerp.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 实体父类
 * Bro，以后所有的业务表都继承它，省去重复写 ID 和审计字段的麻烦
 */
@Data
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     * 策略已经在 yml 里配置了 ASSIGN_ID，但这里显式写出来更清晰
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 创建时间
     * 对应数据库 create_time
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     * 对应数据库 update_time
     */
    private LocalDateTime updateTime;

    /**
     * 逻辑删除
     * select * 时会自动带上 where is_deleted = 0
     */
    @TableLogic
    private Integer isDeleted;
}