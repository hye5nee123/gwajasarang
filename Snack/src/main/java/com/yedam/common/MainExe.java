package com.yedam.common;

import org.apache.ibatis.session.SqlSession;

import com.yedam.cart.mapper.CartMapper;
import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;

public class MainExe {

	public static void main(String[] args) {
		
		SqlSession session = DataSource.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);
		
		CartService svc = new CartServiceImpl();
		CartVO vo = new CartVO();
		
		vo.setCartCode(110);
		vo.setQuantity(3);
		System.out.println(vo);
		
		System.out.println(mapper.updateCart(vo));
		System.out.println("svc : " + svc.modCart(vo));
	}

}
