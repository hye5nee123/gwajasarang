package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.goods.command.GetGoodsControl;
import com.yedam.goods.command.GoodsListControl;
import com.yedam.goods.command.GoodsListJson;
import com.yedam.goods.command.SearchListControl;

public class DFrontController extends HttpServlet{
	// 신혜원
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap() {
		map.put("/goodsList.do", new GoodsListControl());	// 상품목록
//		map.put("/goodsListJson.do", new GoodsListJson());
		map.put("/getGoods.do", new GetGoodsControl());	// 상품 상세페이지
		map.put("/searchList.do", new SearchListControl());	// 상품검색
		return map;
	}
}
