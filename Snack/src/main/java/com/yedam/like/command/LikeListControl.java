package com.yedam.like.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.like.service.LikeService;
import com.yedam.like.serviceImpl.LikeServiceImpl;
import com.yedam.like.vo.LikeVO;

public class LikeListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberCode = req.getParameter("membercode");

		LikeService svc = new LikeServiceImpl();
		List<LikeVO> list = svc.selectList(memberCode);
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/like/likeList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
