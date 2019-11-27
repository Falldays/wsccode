package com.qst.ssm.entity;

import java.util.Date;

public class Order {

    private Integer orderId;             //订单表ID
    private String orderNo;             //订单号
    private Integer userId;              //用户ID
    private Integer orderPrice;             //订单价格
    private String expressNo;           //快递单号
    private Date createTime;          //创建时间
    /**
     *订单状态
     */
    private Integer orderStatus;

    public Order() {
    }

    public Order(Integer orderId, String orderNo, Integer userId, Integer orderPrice, String expressNo, Date createTime, Integer orderStatus) {
        this.orderId = orderId;
        this.orderNo = orderNo;
        this.userId = userId;
        this.orderPrice = orderPrice;
        this.expressNo = expressNo;
        this.createTime = createTime;
        this.orderStatus = orderStatus;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getExpressNo() {
        return expressNo;
    }

    public void setExpressNo(String expressNo) {
        this.expressNo = expressNo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", orderNo='" + orderNo + '\'' +
                ", userId=" + userId +
                ", orderPrice=" + orderPrice +
                ", expressNo='" + expressNo + '\'' +
                ", createTime=" + createTime +
                ", orderStatus=" + orderStatus +
                '}';
    }
}
