package com.yedam.review.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class ReviewListAjax implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
	
		String goodsCode = req.getParameter("goodsCode");
		req.setAttribute("goodsCode", goodsCode);
		
		try {
			req.getRequestDispatcher("/WEB-INF/review/reviewListAjax.jsp").forward(req,resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
