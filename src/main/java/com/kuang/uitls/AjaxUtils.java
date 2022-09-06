package com.kuang.uitls;

import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.List;

/**
 * @author yz
 * @data: 2021/10/24 22:10 星期日
 * @file : AjaxUtils.java
 */
public class AjaxUtils extends HashMap<String, Object> {

    /**
     * 状态码
     */
    public static final String CODE_TAG = "code";

    /**
     * 返回内容
     */
    public static final String MSG_TAG = "msg";

    /**
     * 返回数量
     */
    public static final String COUNT_TAG = "count";

    /**
     * 数据对象
     */
    public static final String DATA_TAG = "data";

    /**
     * 返回状态
     */
    public static final String BOOL_TAG = "bool";

    /**
     * 初始化一个新创建的 AjaxUtils 对象，使其表示一个空消息。
     */
    public AjaxUtils() {
    }

    /**
     * 初始化一个新创建的 AjaxUtils 对象
     *
     * @param type 状态类型
     * @param msg  返回内容
     */

    public AjaxUtils(@NotNull Type type, String msg) {
        super.put(CODE_TAG, type.value);
        super.put(MSG_TAG, msg);
    }

    public AjaxUtils(@NotNull Type type, Boolean bool, String msg) {
        super.put(CODE_TAG, type.value);
        super.put(BOOL_TAG, bool);
        super.put(MSG_TAG, msg);
    }

    public AjaxUtils(@NotNull Type type, Boolean bool) {
        super.put(CODE_TAG, type.value);
        super.put(BOOL_TAG, bool);

    }

    public AjaxUtils(@NotNull Type type, Boolean bool, Object data) {
        super.put(CODE_TAG, type.value);
        super.put(BOOL_TAG, bool);
        super.put(DATA_TAG, data);
    }

    public AjaxUtils(Object data) {
        super.put(DATA_TAG, data);
    }

    public AjaxUtils(Boolean bool) {
        super.put(BOOL_TAG, bool);
    }

    public AjaxUtils(String msg) {
        super.put(MSG_TAG, msg);
    }


    public AjaxUtils(Boolean bool, String msg) {
        super.put(BOOL_TAG, bool);
        super.put(MSG_TAG, msg);
    }

    public AjaxUtils(Boolean bool, Object data) {
        super.put(BOOL_TAG, bool);
        super.put(DATA_TAG, data);
    }


    public AjaxUtils(Boolean bool, String msg, Object data) {
        super.put(BOOL_TAG, bool);
        super.put(MSG_TAG, msg);
        super.put(DATA_TAG, data);
    }


    public AjaxUtils(Integer code, Boolean bool, String msg, Object data) {
        super.put(CODE_TAG, code);
        super.put(BOOL_TAG, bool);
        super.put(MSG_TAG, msg);
        super.put(DATA_TAG, data);
    }

    public AjaxUtils(Integer code, Boolean bool, String msg) {
        super.put(CODE_TAG, code);
        super.put(BOOL_TAG, bool);
        super.put(MSG_TAG, msg);

    }


    public AjaxUtils(Integer count, List<?> data) {
        super.put(CODE_TAG, 0);
        super.put(MSG_TAG, "");
        super.put(COUNT_TAG, count);
        super.put(DATA_TAG, data);
    }

    public AjaxUtils(String msg, Integer count, List<?> data) {
        super.put(CODE_TAG, 0);
        super.put(MSG_TAG, msg);
        super.put(COUNT_TAG, count);
        super.put(DATA_TAG, data);
    }

    public AjaxUtils(Integer code, String msg, Integer count) {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
        super.put(COUNT_TAG, count);
    }

    public AjaxUtils(Integer code, String msg, Integer count, List<?> data) {
        super.put(CODE_TAG, code);
        super.put(MSG_TAG, msg);
        super.put(COUNT_TAG, count);
        super.put(DATA_TAG, data);
    }


    /**
     * 方便链式调用
     *
     * @param key   键
     * @param value 值
     * @return 数据对象
     */
    @Override
    public AjaxUtils put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    /**
     * 状态类型
     */
    public enum Type {
        /**
         * 成功
         */
        SUCCESS(0),
        /**
         * 警告
         */
        WARN(301),
        /**
         * 错误
         */
        ERROR(500);
        private final int value;

        Type(int value) {
            this.value = value;
        }

        public int value() {
            return this.value;
        }
    }


}
