package com.yedam.orders.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;
import com.yedam.orders.vo.OrdersVO;

public class OrdersListJson {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberCode = req.getParameter("memberCode");
		String page = req.getParameter("page");
		OrdersService svc = new OrdersServiceImpl();
		List<OrdersVO> list = svc.OrdersListPaging(memberCode, Integer.parseInt(page));
		String json = "[";
		for (int i = 0; i < list.size(); i++) {
			json += "{\"orderCode\":" + list.get(i).getOrderCode() 
					+ ",\"MemberCode\":\"" + list.get(i).getMemberCode() + "\"" + ",\"OrderName\":\"" + list.get(i).getOrderName()
					+ "\"}";
			if (i != list.size() - 1) {
				json += ",";
			}
		}

		json += "]";

		try {
			resp.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
