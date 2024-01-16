package com.yedam.orders2.mapper;

import java.util.List;

import com.yedam.orders2.vo.OrdersVO;

public interface OrdersMapper {


	//test
	List<OrdersVO> selectList();

	OrdersVO selectOne(String ono);
	//b
	int insertOrders(OrdersVO vo);
}