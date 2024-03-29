package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.detail.service.DetailService;
import com.yedam.detail.serviceImpl.DetailServiceImpl;
import com.yedam.detail.vo.DetailVO;

public class AddReviewFormControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String detailCode = req.getParameter("detailCode");
		DetailService svc = new DetailServiceImpl();
	
		DetailVO vo = svc.getDetail(detailCode);
		req.setAttribute("detailCode", detailCode);
		req.setAttribute("vo", vo);
		
		RequestDispatcher rd = req.getRequestDispatcher("/review/addReviewForm.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
