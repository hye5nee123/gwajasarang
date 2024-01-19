package com.yedam.orders.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.orders.service.OrdersService;
import com.yedam.orders.serviceImpl.OrdersServiceImpl;

public class OrdersCountJson {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
	OrdersService svc = new OrdersServiceImpl();
	List<HashMap<String,Object>> list = svc.chartDate();
	Gson gson = new GsonBuilder().create();
	resp.setContentType("text/json;charset=UTF-8");
	try {
		resp.getWriter().print(gson.toJson(list));
	} catch (IOException e) {
		e.printStackTrace();
	}
	}
	}

