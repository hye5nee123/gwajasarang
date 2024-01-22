package com.yedam.main.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.serviceimpl.GoodsServiceImpl;
import com.yedam.goods.vo.GoodsVO;

public class mainPageControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String category = req.getParameter("category");
		
		GoodsService svc = new GoodsServiceImpl();
		List<GoodsVO> recommendList = svc.recommendList(null, 12);
		
		req.setAttribute("category", category);
		req.setAttribute("recommendList", recommendList);

		try {
			req.getRequestDispatcher("mainpage/mainPage.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
		
	}

}
