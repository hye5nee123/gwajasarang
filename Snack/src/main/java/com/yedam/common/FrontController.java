package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.review.command.GetLReviewControl;
import com.yedam.review.command.ReviewListControl;

public class FrontController extends HttpServlet {
	
	Map<String, Control> map;

	public FrontController() {
		System.out.println("생성자 호출.");
		map = new HashMap<String, Control>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
		
		// 리뷰 게시판 기능
		map.put("/reviewList.do", new ReviewListControl()); // 리뷰 목록
		map.put("/getReview.do", new GetLReviewControl());  // 리뷰 단건조회
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");

		System.out.println("service() 호출");
		String url = req.getRequestURI();
		String context = req.getContextPath();
		String path = url.substring(context.length());
		System.out.println(path);

		Control ctrl = map.get(path);
		ctrl.execute(req, resp);

	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출.");
	}
}
