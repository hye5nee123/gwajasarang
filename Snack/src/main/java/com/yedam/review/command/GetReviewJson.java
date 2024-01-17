package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class GetReviewJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String reviewCode = req.getParameter("reviewCode");

		ReviewService svc = new ReviewServiceImpl();
		ReviewVO vo = svc.getReview(Integer.parseInt(reviewCode));

		resp.setContentType("text/json;charset=utf-8");
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(vo));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
