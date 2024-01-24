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
		//1. 파라미터 받기.
		String goodsCode = req.getParameter("goodsCode");
		String memberCode = req.getParameter("memberCode");
		String quantity = req.getParameter("quantity");
		
		
		
		//2. vo에 담기.
		CartVO vo = new CartVO();
		vo.setGoodsCode(goodsCode);
		vo.setMemberCode(memberCode);
		vo.setQuantity(Integer.parseInt(quantity));
		
		//3.service 호출.
		CartService svc = new CartServiceImpl();
		boolean result = svc.addCart(vo);
		
		//4. 결과 저장.
		Map<String, Object> map = new HashMap<>();
		if (result) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		//5. 결과 전송(Json변환 해서).
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
