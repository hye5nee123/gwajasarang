package com.yedam.cart.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.common.Control;

public class OrderResultForm implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String orderCode = req.getParameter("orderCode");
		req.setAttribute("orderCode", orderCode);

		// 페이지 이동(forward)
		RequestDispatcher rd = req.getRequestDispatcher("orders/orderResultForm.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
