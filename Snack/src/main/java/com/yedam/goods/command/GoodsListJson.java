package com.yedam.goods.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.goods.service.GoodsService;
import com.yedam.goods.serviceimpl.GoodsServiceImpl;
import com.yedam.goods.vo.GoodsVO;

public class GoodsListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		GoodsService svc = new GoodsServiceImpl();
		List<GoodsVO> list = svc.goodsList();

		resp.setContentType("text/json;charset=utf-8");
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(list));
	} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}


	}

}
