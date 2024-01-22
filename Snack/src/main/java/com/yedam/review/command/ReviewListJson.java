package com.yedam.review.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

import io.basc.framework.util.page.Page;

public class ReviewListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String goodsCode = req.getParameter("goodsCode");
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> list = svc.reviewListPaging(goodsCode, Integer.parseInt(page));
		
		resp.setContentType("text/json;charset=utf-8");
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
