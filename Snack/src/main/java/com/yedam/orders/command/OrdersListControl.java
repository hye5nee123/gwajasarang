package com.yedam.orders.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.orders.service.ordersService;
import com.yedam.orders.vo.OrdersVO;

public class OrdersListControl {

	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ordersService svc = new OrdersServiceImpl();
		List<OrdersVO> list = svc.ordersLisrt();
	}
}
