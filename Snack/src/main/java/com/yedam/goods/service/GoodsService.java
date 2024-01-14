package com.yedam.goods.service;

import java.util.List;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> goodsList();
	public GoodsVO getGoods(int gcode);

}
