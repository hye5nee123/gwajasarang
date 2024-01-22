package com.yedam.detail.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.detail.service.DetailService;
import com.yedam.detail.serviceImpl.DetailServiceImpl;
import com.yedam.detail.vo.DetailVO;

public class AddDetailJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/json;charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		DetailVO vo = new DetailVO();

		String detailCode = req.getParameter("detailCode");
		String ordersCode = req.getParameter("ordersCode");
		String goodsCode = req.getParameter("goodsCode");
		String quantity = req.getParameter("quantity");
		String detailPrice = req.getParameter("detailPrice");

		vo.setDetailCode(detailCode);
		vo.setOrderCode(ordersCode);
		vo.setGoodsCode(goodsCode);
		vo.setQuantity(Integer.parseInt(quantity));
		vo.setDetailPrice(Integer.parseInt(detailPrice));

		DetailService svc = new DetailServiceImpl();
		Map<String, Object> map = new HashMap<>();

		if (svc.addDetail(ordersCode)) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}

		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
