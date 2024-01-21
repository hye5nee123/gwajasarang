
package com.yedam.orders.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.orders.vo.OrdersVO;



public interface OrdersMapper {
	List<OrdersVO> selectList(String memberCode);
	OrdersVO selectOne(@Param("orderCode") String orderCode);
	List<OrdersVO> OrdersListPaging(@Param("memberCode") String memberCode, @Param("page") int page);
	
	int deleteOrders(String orderCode); //삭제
	int deleteDetail(String orderCode); //상세삭제
	int updateOrders(OrdersVO vo); //수정
	int insertOrders(OrdersVO vo); //추가
	
	int selectCount(String memberCode);//페이지 계산하기 위한 전체건수 반환.
	List<HashMap<String, Object>> selectOrderCnt();//차트 데이터
}

