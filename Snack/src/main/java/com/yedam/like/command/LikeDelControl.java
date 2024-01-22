package com.yedam.like.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.like.service.LikeService;
import com.yedam.like.serviceImpl.LikeServiceImpl;

public class LikeDelControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String goodsCode = req.getParameter("goodsCode");
		String memberCode = req.getParameter("memberCode");
		
		
		LikeService svc = new LikeServiceImpl();
		Map<String, Object> map = new HashMap<>();
		if(svc.remLike(goodsCode, memberCode)) {
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
