package com.yedam.orders2.service;

import java.util.List;

import com.yedam.orders2.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList();
    public boolean addOrders(OrdersVO vo);
}
