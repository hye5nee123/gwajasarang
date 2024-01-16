package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.orders2.command.AddOrdersControl;

public class FrontController extends HttpServlet {

	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출.");

		// 주문관련.
		map.put("/addOrders.do", new AddOrdersControl());

		//super.init(config);
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
