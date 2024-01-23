package com.yedam.orders.service;

import java.util.HashMap;
import java.util.List;

import com.yedam.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList(String memberCode); //목록
    public List<OrdersVO> OrdersListPaging(String memberCode,int page);//페이징
	public OrdersVO getOrders(String ordersCode);

	

	public boolean deleteOrders(String orderCode);//삭제
	//public boolean deleteDetail(String orderCode);
	
	public boolean modOrders(OrdersVO vo); //수정
	
	 public boolean addOrders(OrdersVO vo);//추가
	 
	 int getTotalCnt(String memberCode); //전체 건수계산.
	 
	
	public List<HashMap<String, Object>> chartDate();
} 
