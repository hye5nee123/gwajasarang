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
		String orderCode = req.getParameter("ordercode");
		OrdersService svc = new OrdersServiceImpl();
		boolean rem = svc.remOrders(orderCode);
		try {
			if (rem) {
				resp.sendRedirect("ordersList.do");
			} else {
				resp.sendRedirect("removeOrders.do");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
