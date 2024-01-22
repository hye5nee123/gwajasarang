package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.orders.command.AddOrdersControl;
import com.yedam.orders.command.DeleteControl;
import com.yedam.orders.command.GetOrdersControl;
import com.yedam.orders.command.ModifyControl;
import com.yedam.orders.command.ModifyFormControl;
import com.yedam.orders.command.OrdersListControl;
import com.yedam.orders.command.PagingListJson;

public class BFrontController extends HttpServlet{
	// 도승민
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/ordersList.do", new OrdersListControl());  	//주문 목록
		
		map.put("/getOrders.do", new GetOrdersControl());    	//주문 상세내역
		map.put("/deleteOrders.do", new DeleteControl()); 		//삭제
		map.put("/modifyForm.do", new ModifyFormControl()); 	//수정

		map.put("/modifyOrders.do", new ModifyControl()); 
		//map.put("/pagingListJson.do", new PagingListJson()); 	//페이징
		//map.put("/addorders.do", new AddOrdersControl()); 		//추가
		
		
		return map;
	}
}
