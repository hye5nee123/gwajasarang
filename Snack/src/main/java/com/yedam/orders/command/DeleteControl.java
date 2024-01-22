package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;

public class DeleteControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//선언
		HttpSession session = req.getSession();
		OrdersService svc = new OrdersServiceImpl();
		
		String ordersCode = req.getParameter("orderCode");
		//String memberCode =(String) session.getAttribute("logCode");//req.getParameter("memberCode");
		
		boolean rem = svc.deleteOrders(ordersCode);
		
		try {
			if (rem) {
				resp.sendRedirect("ordersList.do");				
			} else {
				resp.sendRedirect("getOrders.do?orderCode="+ordersCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
