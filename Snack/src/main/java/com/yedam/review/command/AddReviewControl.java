package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class AddReviewControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ReviewVO vo = new ReviewVO();

		String goodsCode = req.getParameter("goodsCode");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String stars = req.getParameter("stars");
		
		vo.setGoodsCode(goodsCode);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setStars(Integer.parseInt(stars));

		ReviewService svc = new ReviewServiceImpl();
		try {
			if (svc.addReview(vo)) {
				// 등록 성공시 목록페이지로 이동
				System.out.println("등록 완료!");
				resp.sendRedirect("reviewList.do?goodsCode=" + goodsCode);
			} else {
				// 등록 실패시 등록페이지로 이동
				System.out.println("등록 실패!");
				resp.sendRedirect("/review/addReviewForm.tiles");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
