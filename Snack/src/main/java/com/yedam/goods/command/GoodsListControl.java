package com.yedam.goods.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.CommonUtil;
import com.yedam.common.Control;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.serviceimpl.GoodsServiceImpl;
import com.yedam.goods.vo.GoodsVO;
import com.yedam.goods.vo.PageDTO;


public class GoodsListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		GoodsService svc = new GoodsServiceImpl();
		
		// 파라미터
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");
		String page = req.getParameter("page");
		page = (page == null)? "1" : page;
		String sort = req.getParameter("sort");
		
		// 전체 상품
		List<GoodsVO> goodsList = svc.goodsList(category, Integer.parseInt(page), sort);
		// 추천 상품 
		List<GoodsVO> recommendList = svc.recommendList(category, 6);
		
		// 페이지처리
		int total = svc.totalCnt(category, keyword);
		PageDTO dto = new PageDTO(Integer.parseInt(page), total);
		
		// 결과 저장 후 페이지 이동
		req.setAttribute("category", category);
		req.setAttribute("sort", sort);
		req.setAttribute("goodsList", goodsList);
		req.setAttribute("recommendList", recommendList);
		req.setAttribute("total", total);
		req.setAttribute("dto", dto);
		CommonUtil.forward(req, resp, "goods/goodsList.tiles");
		
	}

}
