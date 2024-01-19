package com.yedam.cart.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class CheckoutFormControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberCode = req.getParameter("memberCode");
		req.setAttribute("memberCode", memberCode);
		// 페이지 이동(forward)
		RequestDispatcher rd = req.getRequestDispatcher("cart/checkout.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
