package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.orders.command.OrdersListControl;
import com.yedam.orders.command.RemoveFormControl;
import com.yedam.orders.command.RemoveOrdersControl;
import com.yedam.orders.command.getOrdersControl;

public class BFrontController extends HttpServlet{
	// 도승민
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/ordersList.do", new OrdersListControl());  // 주문 목록
		map.put("/getOrders.do", new getOrdersControl());    //주문 상세내역
		map.put("/removeOrdersAll.do", new RemoveFormControl());  // 전체 삭제
		map.put("/remOrders.do", new RemoveOrdersControl()); //단건삭제
		//map.put("/modifyOrders.do", new ModifyOrdersControl());
		return map;
	}
}
