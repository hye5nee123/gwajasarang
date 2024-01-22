package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberAddControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		MemberVO vo = new MemberVO();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String addressDetail = req.getParameter("addressDetail");
		String postcode = req.getParameter("postcode");
		String email = req.getParameter("email");
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setMemberName(name);
		vo.setMemberPhone(phone);
		vo.setMemberAddress(address);
		vo.setEmail(email);
		vo.setMemberAddressDetail(addressDetail);
		vo.setMemberPostcode(Integer.parseInt(postcode));
		
		MemberService svc = new MemberServiceImpl();
		try {
			if(svc.addMember(vo)) {
				resp.sendRedirect("mainPage.do");
			}else{
				resp.sendRedirect("memberAddForm.do");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
}
