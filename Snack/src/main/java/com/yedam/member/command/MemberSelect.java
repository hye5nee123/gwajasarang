package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberSelect implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String memberCode = req.getParameter("memberCode");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO vo = svc.showMember(memberCode);

		req.setAttribute("vo", vo);
		
		try {
			req.getRequestDispatcher("member/memberSelect.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 	
	}

}
