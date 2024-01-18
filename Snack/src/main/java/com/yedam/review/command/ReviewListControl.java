package com.yedam.review.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class ReviewListControl implements Control{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 상품코드 파라미터 받음
		String goodsCode = req.getParameter("goodsCode");
		String page = req.getParameter("page");

		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> list = svc.reviewListPaging(goodsCode, Integer.parseInt(page));
		
		req.setAttribute("reviewList", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/review/reviewList.tiles");
		try {
			rd.forward(req,resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
