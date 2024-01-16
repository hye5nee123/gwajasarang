package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class ReviewListAjax implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.getRequestDispatcher("review/reviewListAjax.tiles").forward(req,resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
