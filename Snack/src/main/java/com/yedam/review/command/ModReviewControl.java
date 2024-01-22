package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				System.out.println("수정 완료!");
				resp.sendRedirect("getReview.do?reviewCode=" + vo.getReviewCode());
			} else {
				System.out.println("수정 실패!");
				resp.sendRedirect("modReviewForm.do?reviewCode=" + reviewCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
