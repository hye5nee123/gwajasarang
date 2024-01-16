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
		String goodsCode = req.getParameter("goodsCode");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String stars = req.getParameter("stars");
		
		System.out.println(goodsCode + ", " + title + ", " + content + ", " + stars);

		vo.setGoodsCode(goodsCode);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setStars(Integer.parseInt(stars));

		ReviewService svc = new ReviewServiceImpl();
		// svc의 addBoard() 활용
		// 등록 성공시 목록페이지로 이동
		try {
			if (svc.addReview(vo)) {
				System.out.println("등록 완료!");
				// sendRedirect : 페이지 지정가능(외부 페이지 가능)
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
