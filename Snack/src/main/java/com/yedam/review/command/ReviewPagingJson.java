package com.yedam.review.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.PageDTO;

public class ReviewPagingJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// bno, page => json 생성
		String goodsCode = req.getParameter("goodsCode");
		String page = req.getParameter("page");
		
		ReviewService svc = new ReviewServiceImpl();
		int total = svc.getTotalCnt(goodsCode);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), total);
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(dto));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
