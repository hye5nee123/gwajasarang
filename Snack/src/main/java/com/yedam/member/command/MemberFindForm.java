package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberFindForm implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
//		String name = req.getParameter("name");
//		String phone = req.getParameter("phone");
//		
//		MemberService svc = new MemberServiceImpl();
//		MemberVO vo = new MemberVO();
//		vo.setMemberName(name);
//		vo.setMemberPhone(phone);
//
//		req.setAttribute("vo", vo);
		
		try {
			req.getRequestDispatcher("member/memberFind.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
		
	}

}
