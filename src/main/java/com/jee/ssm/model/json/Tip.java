package com.jee.ssm.model.json;

/**
 * json返回用的实体类
 */
public class Tip {

    /**
     * 状态：
     * true or false
     */
    Boolean success;

    /**
     * 处理状态标识
     * -1 服务器拒绝访问/未登录
     * 0 暂未定义
     * 1 错误1
     * 2 错误2
     * ...
     */
    Integer code;


    String message;

    /**
     * 需要返回的数据，可以是任何对象
     */
    Object data;

    /**
     * 默认为 true
     */
    public Tip(){
        this.success = true;
    }

    /**
     * 操作成功，并携带一段数据
     */
    public Tip(Object data){
        this.success = true;
        this.data = data;
    }
    /**
     * 操作成功，并携带两段数据
     */
    public Tip(Object data,String data1){
        this.success = true;
        this.data = data;
        this.message = data1;
    }

    public Tip(String message,Object data){
        this.success = true;
        this.message =message;
        this.data = data;
    }

    /**
     * 操作成功，并携带一条提示
     */
    public Tip(String message){
        this.success = true;
        this.message = message;
    }

    /**
     * 返回错误，并标识错误代码
     * @param code
     */
    public Tip(Integer code){
        this.success = false;
        this.code = code;
    }

    /**
     * 返回指定标识错误，并携带一段提示；
     * @param message
     * @param code
     */
    public Tip(Integer code,String message){
        this.success = false;
        this.code = code;
        this.message = message;
    }
    /**
     * 返回指定标识错误，并携带一段提示和数据；
     * @param code
     * @param message
     * @param data
     */
    public Tip(Integer code, String message, Object data){
        this.success = false;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * 返回指定标识错误，并携带一段数据；
     * @param code
     * @param data
     */
    public Tip(Integer code,Object data){
        this.success = false;
        this.code = code;
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }


}
