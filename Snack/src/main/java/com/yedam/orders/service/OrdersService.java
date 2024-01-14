package com.yedam.orders.service;

import java.util.List;

import com.yedam.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList();
    public boolean addOrders(OrdersVO vo);
}
