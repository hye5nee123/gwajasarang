package com.yedam.orders.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.orders.vo.OrdersVO;



public interface OrdersMapper {
	List<OrdersVO> selectList();
	OrdersVO selectOne(@Param("orderCode") String orderCode);
	
	int remOrdersone(String orderCode);
}
