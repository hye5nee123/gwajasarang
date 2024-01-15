package com.yedam.orders.mapper;

import java.util.List;

import com.yedam.orders.vo.OrdersVO;

public interface OrdersMapper {


	//test
	List<OrdersVO> selectList();

	OrdersVO selectOne(String ono);
	//b
	int insertOrders(OrdersVO vo);
}