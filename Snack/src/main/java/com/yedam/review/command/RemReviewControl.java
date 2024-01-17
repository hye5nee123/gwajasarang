package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;

public class RemReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String reviewCode = req.getParameter("reviewCode");
		String goodsCode = req.getParameter("goodsCode");
		ReviewService svc = new ReviewServiceImpl();

		try {
			if (svc.remReview(Integer.parseInt(reviewCode))) {
				System.out.println("삭제 완료!");
				resp.sendRedirect("reviewList.do?goodsCode=" + goodsCode);
			} else {
				System.out.println("삭제 실패!");
				resp.sendRedirect("modReviewForm.do?reviewCode=" + reviewCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
