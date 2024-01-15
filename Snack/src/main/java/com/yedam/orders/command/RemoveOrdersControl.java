package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;

public class RemoveOrdersControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String orderCode = req.getParameter("orderCode");
		OrdersService svc = new OrdersServiceImpl();
		boolean rem = svc.remOrders(orderCode);
		System.out.println(rem);
		try {
			if (rem) {
				resp.sendRedirect("ordersList.do");
			} else {
				resp.sendRedirect("getOrders.do?orderCode="+orderCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
