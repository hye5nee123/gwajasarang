package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class GetReviewAjax implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		String reviewCode = req.getParameter("reviewCode");
		req.setAttribute("reviewCode", reviewCode);
		
		try {
			req.getRequestDispatcher("review/getReviewAjax.tiles").forward(req,resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
