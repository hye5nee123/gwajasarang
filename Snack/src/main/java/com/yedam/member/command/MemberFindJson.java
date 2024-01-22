package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberFindJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		MemberService svc = new MemberServiceImpl();
		String findId = svc.findId(name, phone);
		
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(findId)); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
