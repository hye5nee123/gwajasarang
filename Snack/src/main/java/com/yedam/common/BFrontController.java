package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.orders.command.OrdersListControl;
import com.yedam.orders.command.DeleteControl;
import com.yedam.orders.command.ModifyControl;
import com.yedam.orders.command.ModifyFormControl;
import com.yedam.orders.command.GetOrdersControl;

public class BFrontController {

	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/ordersList.do", new OrdersListControl());  // 주문 목록
		map.put("/getOrders.do", new GetOrdersControl());    //주문 상세내역
		map.put("/deleteOrders.do", new DeleteControl()); //삭제
		map.put("/modifyOrders.do", new ModifyControl()); //수정
		map.put("/modifyForm.do", new ModifyFormControl());
		return map;
	}
}
