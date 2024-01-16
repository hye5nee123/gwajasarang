package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.orders2.command.AddOrdersControl;

public class EFrontController extends HttpServlet{

	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/addOrders.do", new AddOrdersControl());
		return map;
	}
}
