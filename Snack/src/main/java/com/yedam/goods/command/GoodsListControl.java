package com.yedam.goods.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.serviceimpl.GoodsServiceImpl;
import com.yedam.goods.vo.GoodsVO;
import com.yedam.goods.vo.PageDTO;


public class GoodsListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");
		String page = req.getParameter("page");
		page = (page == null)? "1" : page;
		
		GoodsService svc = new GoodsServiceImpl();
		List<GoodsVO> goodsList = svc.goodsList(category, Integer.parseInt(page));
		int total = svc.totalCnt(category, keyword);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), total);
		
		req.setAttribute("category", category);
		req.setAttribute("goodsList", goodsList);
		req.setAttribute("total", total);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("goods/goodsList.tiles");
		
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
