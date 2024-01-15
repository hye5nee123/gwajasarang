package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.orders.command.OrdersListControl;
import com.yedam.orders.command.RemoveFormControl;
import com.yedam.orders.command.RemoveOrdersControl;
import com.yedam.orders.command.getOrdersControl;

public class FrontController extends HttpServlet {
	
	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출.");
		map.put("/ordersList.do", new OrdersListControl());  // 주문 목록
		map.put("/getOrders.do", new getOrdersControl());    //주문 상세내역
		map.put("/removeOrdersAll.do", new RemoveFormControl());  // 전체 삭제
		map.put("/remOrders.do", new RemoveOrdersControl()); //단건삭제
		//map.put("/modifyOrders.do", new ModifyOrdersControl());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String url = req.getRequestURI(); // /BoardWeb/main.do
		String context = req.getContextPath(); // /BoardWeb
		String path = url.substring(context.length());
		System.out.println(path);

		Control ctrl = map.get(path);
		ctrl.execute(req, resp);

	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출.");
	}
}