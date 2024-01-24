package com.yedam.cart.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.common.Control;

public class CheckCartJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String goodsCode = req.getParameter("goodsCode");
		String memberCode = req.getParameter("memberCode");
		
		CartService svc = new CartServiceImpl();
		Integer cartCode = svc.checkCart(goodsCode, memberCode);
		
		Gson gson = new GsonBuilder().create();
		
		//map 없이 바로 넘기기 가능.
		try {
			resp.getWriter().print(gson.toJson(cartCode));
			// == resp.getWriter().print(cartCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
