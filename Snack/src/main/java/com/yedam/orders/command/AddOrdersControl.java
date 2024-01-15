package com.yedam.orders.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceMybatis;
import com.yedam.orders.vo.OrdersVO;

public class AddOrdersControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		OrdersVO vo = new OrdersVO();

		if (req.getMethod().equals("GET")) {
			
			String address = req.getParameter("order_address");
			String name = req.getParameter("order_name");
			String phone = req.getParameter("order_phone");
			String memo = req.getParameter("memo");
												
			vo.setOrderAddress(address);
			vo.setOrderName(name);
			vo.setOrderPhone(phone);
			vo.setMemo(memo);
			
			
		}

		OrdersService svc = new OrdersServiceMybatis();

		

	}
}
