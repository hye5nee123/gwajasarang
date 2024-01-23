package com.yedam.review.command;

import java.io.IOException;
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

public class ModReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

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
		try {
			if (svc.modReview(vo)) {
				// 등록 성공시 목록페이지로 이동
				resp.sendRedirect("getReview.do?reviewCode=" + reviewCode);
			} else {
				// 등록 실패시 등록페이지로 이동
				resp.sendRedirect("addReviewForm.do?reviewCode=" + reviewCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
