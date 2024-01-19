package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.cart.command.AddCartControl;
import com.yedam.cart.command.CartListControl;
import com.yedam.cart.command.CartListControl;
import com.yedam.cart.command.CartListJson;
import com.yedam.cart.command.RemoveCartControl;


public class EFrontController extends HttpServlet {

	// 조혜원
	Map<String, Control> map = new HashMap<>();

	Map<String, Control> getMap() {
		

		// 장바구니 이동.
		map.put("/cartList.do", new CartListControl());
		// 장바구니 DB에 데이터를 Json 타입으로 데이터변환.
		map.put("/cartListJson.do", new CartListJson());
		// 장바구니 삭제.
		map.put("/removeCart.do", new RemoveCartControl());
		//장바구니 수량 추가.
		map.put("/addCart.do", new AddCartControl());
		return map;
	}

}