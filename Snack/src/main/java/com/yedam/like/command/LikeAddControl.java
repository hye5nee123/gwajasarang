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
import com.yedam.like.vo.LikeVO;

public class LikeAddControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberCode = req.getParameter("memberCode");
		String goodsCode = req.getParameter("goodsCode");
		
		LikeVO vo = new LikeVO();
		vo.setMemberCode(memberCode);
		vo.setGoodsCode(goodsCode);
		
		
		LikeService svc = new LikeServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		boolean result = svc.addLike(vo);
		
		if (result) {
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
