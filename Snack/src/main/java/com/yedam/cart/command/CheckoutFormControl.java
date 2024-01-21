package com.yedam.cart.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class CheckoutFormControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberCode = req.getParameter("memberCode");
		req.setAttribute("memberCode", memberCode);

		MemberService svc = new MemberServiceImpl();
		MemberVO vo = svc.showMember(memberCode);
		
		CartService svc1 = new CartServiceImpl();
		req.setAttribute("vo", vo);
		
		// 페이지 이동(forward)
		RequestDispatcher rd = req.getRequestDispatcher("cart/checkout.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
