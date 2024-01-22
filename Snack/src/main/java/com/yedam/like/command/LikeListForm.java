package com.yedam.like.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.like.service.LikeService;
import com.yedam.like.serviceImpl.LikeServiceImpl;
import com.yedam.like.vo.LikeVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class LikeListForm implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberCode = req.getParameter("membercode");

		LikeService svc = new LikeServiceImpl();
		List<LikeVO> list = svc.selectList(memberCode);
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher("like/likeList.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 	
	}

}
