package com.yedam.orders.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.orders.vo.OrdersVO;

public class AddOrdersControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		OrdersVO vo = new OrdersVO();
		
		if(req.getMethod().equals("GET")) {
			String
		}

}
