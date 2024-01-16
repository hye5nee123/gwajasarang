package com.yedam.cart.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class ShowCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//구현 클래스.
		CartService cvc = new CartServiceImpl();
		List<CartVO> list = cvc.cartList(null);
		
		req.setAttribute("CartList", list);
		
		try {
			req.getRequestDispatcher("cart/cart.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 

	}

}
