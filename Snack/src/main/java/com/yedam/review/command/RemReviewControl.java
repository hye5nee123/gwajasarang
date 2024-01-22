package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class RemReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String orderCode = req.getParameter("orderCode");
		String reviewCode = req.getParameter("reviewCode");
		ReviewService svc = new ReviewServiceImpl();
		try {
			if (svc.remReview(Integer.parseInt(reviewCode))) {
				resp.sendRedirect("getOrders.do?orderCode=" + orderCode);
			} else {
				resp.sendRedirect("getReview.do?reviewCode=" + reviewCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
