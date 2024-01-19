package com.yedam.orders.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.PageDTO;

public class PagingListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String memberCode = req.getParameter("memberCode");
		String page = req.getParameter("page");
		
		OrdersService svc = new OrdersServiceImpl();
		int total = svc.getTotalCnt(memberCode);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page),total);
		Gson gson = new GsonBuilder().create();
		
		try {
			resp.getWriter().print(gson.toJson(dto));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
