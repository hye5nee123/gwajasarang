package com.yedam.detail.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.detail.service.DetailService;
import com.yedam.detail.serviceImpl.DetailServiceImpl;
import com.yedam.detail.vo.DetailVO;

public class DetailListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/json;charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String ordersCode = req.getParameter("ordersCode");
		DetailService svc = new DetailServiceImpl();
		List<DetailVO> list = svc.detailList(ordersCode);
		
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
