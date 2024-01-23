package com.yedam.cart.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class AddCartControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		CartVO vo = new CartVO();
		String goodsCode = req.getParameter("goodsCode");
		String memberCode = req.getParameter("memberCode");
		String quantity = req.getParameter("quantity");

		vo.setGoodsCode(goodsCode);
		vo.setMemberCode(memberCode);
		vo.setQuantity(Integer.parseInt(quantity));
		
		CartService svc = new CartServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		if (svc.addCart(vo)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}

		Gson gson = new GsonBuilder().create();
		
		try {
//			json형식으로 보내겠다.
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
