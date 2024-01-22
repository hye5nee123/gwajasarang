package com.yedam.like.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.like.service.LikeService;
import com.yedam.like.serviceImpl.LikeServiceImpl;
import com.yedam.like.vo.LikeVO;

public class LikeListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberCode = req.getParameter("memberCode");

		LikeService svc = new LikeServiceImpl();
		List<LikeVO> list = svc.selectList(memberCode);
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
