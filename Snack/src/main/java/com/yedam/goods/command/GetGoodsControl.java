package com.yedam.goods.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.serviceimpl.GoodsServiceImpl;
import com.yedam.goods.vo.GoodsVO;

public class GetGoodsControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String gcode = req.getParameter("gcode");
		
		GoodsService svc = new GoodsServiceImpl();
		GoodsVO vo = svc.getGoods(gcode);
		
		req.setAttribute("vo", vo);
		
		RequestDispatcher rd = req.getRequestDispatcher("goods/getGoods.tiles");
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
