
package com.yedam.orders.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.orders.vo.OrdersVO;



public interface OrdersMapper {
	List<OrdersVO> selectList(String memberCode);
	OrdersVO selectOne(@Param("orderCode") String orderCode);
	
	int deleteOrders(String orderCode); //삭제
	int deleteDetail(String orderCode); //상세삭제
	int updateOrders(OrdersVO vo); //수정
}

