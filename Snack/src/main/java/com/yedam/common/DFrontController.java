package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.goods.command.GetGoodsControl;
import com.yedam.goods.command.GoodsListControl;
//import com.yedam.goods.command.GoodsListJson;
import com.yedam.goods.command.SearchListControl;

public class DFrontController extends HttpServlet{
	// 신혜원
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap() {
		map.put("/ ", new GoodsListControl());
//		map.put("/goodsListJson.do", new GoodsListJson());
		map.put("/getGoods.do", new GetGoodsControl());
		map.put("/searchList.do", new SearchListControl());
		return map;
	}
}
