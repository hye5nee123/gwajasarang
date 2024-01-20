package com.yedam.review.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class ModReviewJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/json;charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ReviewVO vo = new ReviewVO();

		String reviewCode = req.getParameter("reviewCode");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String stars = req.getParameter("stars");

		vo.setReviewCode(Integer.parseInt(reviewCode));
		vo.setTitle(title);
		vo.setContent(content);
		vo.setStars(Integer.parseInt(stars));

		ReviewService svc = new ReviewServiceImpl();
		Map<String, Object> map = new HashMap<>();		
		
		if(svc.modReview(vo)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
