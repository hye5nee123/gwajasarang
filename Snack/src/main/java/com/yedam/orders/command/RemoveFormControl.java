package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;

public class RemoveFormControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String ordersCode = req.getParameter("orderCode");
		
		OrdersService svc = new OrdersServiceImpl();
		OrdersVO vo = svc.getOrders(ordersCode);
		
		req.setAttribute("vo", vo);
		RequestDispatcher rd = req.getRequestDispatcher("orders/remOrdersForm.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
