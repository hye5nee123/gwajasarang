package com.yedam.cart.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;
import com.yedam.common.Control;

public class CartListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//선언한 memberCode는 받아온 파라메타값 memberCode다.
		String memberCode = req.getParameter("memberCode");
		//serviceImple을 사용하기 위해 생성.
		CartService svc = new CartServiceImpl();
		//memberCode를 넣어서 cartVO에 선언한 것들의 리스트를 만들어 주겠다(?) 
		List<CartVO> list = svc.cartList(memberCode);
		//?.
		resp.setContentType("text/json;charset=utf-8");
		//Gson 객체를 생성.
		Gson gson = new GsonBuilder().create();	
		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
		
		
	}

}
