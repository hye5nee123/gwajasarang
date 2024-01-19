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
		String page = req.getParameter("page");
		page = (page == null)? "1" : page;
		
		GoodsService svc = new GoodsServiceImpl();
		List<GoodsVO> goodsList = svc.goodsList(category, Integer.parseInt(page));
		int total = svc.totalCnt();
		int totalPage = (int) Math.ceil(total/12.0);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page), total);
		
		//int viewPage = getViewPage();
		
		req.setAttribute("goodsList", goodsList);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
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
