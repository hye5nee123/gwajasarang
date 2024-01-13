package com.yedam.orders.vo;

import lombok.Data;

@Data
// lombok 넣습니다.
public class OrdersVO {
    private String orderCode;
    private String memberCode;
    private String orderDate;
    private String orderAddress;
    private String orderName;
    private String orderPhone;
    private String memo;
    private int deliveryFee;
    private int totalPrice;
}
