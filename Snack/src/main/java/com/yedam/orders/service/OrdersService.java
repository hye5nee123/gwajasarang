package com.yedam.orders.service;

import java.util.List;

import com.yedam.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList(); //목록

	public OrdersVO getOrders(String ordersCode);

	public boolean remOrders(String orderCode);

	
	
	
} 
