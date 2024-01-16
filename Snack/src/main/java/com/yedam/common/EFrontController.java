package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.cart.command.CartListControl;
import com.yedam.orders2.command.AddOrdersControl;

public class EFrontController extends HttpServlet{
	//조혜원
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/addOrders.do", new AddOrdersControl());
		
		//장바구니
		map.put("/showCart.do", new CartListControl());
		map.put("/cartListJson.do", new CartListJson());
		return map;
	}
	
}
