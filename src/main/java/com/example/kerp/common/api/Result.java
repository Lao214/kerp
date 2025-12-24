package com.example.kerp.common.api;

import lombok.Data;
import java.io.Serializable;

/**
 * 通用返回对象
 * Bro，这是我们前后端对话的唯一标准
 */
@Data
public class Result<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 状态码 (200=成功, 500=系统错误, 401=未登录...) */
    private Integer code;

    /** 消息内容 (给用户看的提示) */
    private String message;

    /** 数据对象 (真正的数据) */
    private T data;

    /** 时间戳 */
    private long timestamp = System.currentTimeMillis();

    // 成功静态方法
    public static <T> Result<T> success(T data) {
        Result<T> r = new Result<>();
        r.setCode(200);
        r.setMessage("操作成功");
        r.setData(data);
        return r;
    }

    // 失败静态方法
    public static <T> Result<T> error(Integer code, String msg) {
        Result<T> r = new Result<>();
        r.setCode(code);
        r.setMessage(msg);
        return r;
    }
}