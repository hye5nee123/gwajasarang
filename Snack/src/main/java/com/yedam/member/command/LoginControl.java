package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberService svc = new MemberServiceImpl();
		
		MemberVO vo = svc.login(id, pw);
		
		if(vo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("logCode", vo.getMemberCode());
			session.setAttribute("logId", vo.getId());
			session.setAttribute("logPw", vo.getPw());
			session.setAttribute("logName", vo.getMemberName());
			
			try {
				resp.sendRedirect("mainPage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			req.setAttribute("message", "아이디와 비밀번호를 확인하세요");
			try {
				req.getRequestDispatcher("loginForm.do").forward(req, resp);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}

}
