package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MemberModifyControl  implements Control{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String addressDetail = req.getParameter("addressDetail");
		String postcode = req.getParameter("postcode");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setMemberPhone(phone);		
		vo.setMemberAddress(address);	
		vo.setMemberAddressDetail(addressDetail);	
		vo.setMemberPostcode(Integer.parseInt(postcode));	
		
		
		MemberService svc = new MemberServiceImpl();
		req.setAttribute("vo", vo);
		try {
			if(svc.modMember(vo)) {
				resp.sendRedirect("mainPage.do");
			}else{
				resp.sendRedirect("memberModifyForm.do");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
