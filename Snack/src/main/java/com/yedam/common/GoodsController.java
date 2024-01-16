package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import com.yedam.goods.command.GetGoodsControl;
import com.yedam.goods.command.GoodsListControl;
import com.yedam.goods.command.GoodsListJson;

public class GoodsController {
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap() {
		map.put("/goodsList.do", new GoodsListControl());
		map.put("/goodsListJson.do", new GoodsListJson());
		map.put("/getGoods.do", new GetGoodsControl());
		return map;
	}
}
