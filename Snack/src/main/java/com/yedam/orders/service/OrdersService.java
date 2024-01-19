package com.yedam.orders.service;

import java.util.List;

import com.yedam.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList(String memberCode); //목록

	public OrdersVO getOrders(String ordersCode);

	

	public boolean deleteOrders(String orderCode);//삭제
	//public boolean deleteDetail(String orderCode);
	
	public boolean modOrders(OrdersVO vo); //수정

} 
