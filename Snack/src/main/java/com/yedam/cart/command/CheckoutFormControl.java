package com.yedam.cart.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class CheckoutFormControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberCode = req.getParameter("memberCode");
		req.setAttribute("memberCode", memberCode);
		
		//service 호출.
		MemberService svc = new MemberServiceImpl();
		//단건조회.
		MemberVO vo = svc.showMember(memberCode);
		
		//결과 저장.
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
