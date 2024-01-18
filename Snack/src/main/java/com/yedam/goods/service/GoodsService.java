package com.yedam.goods.service;

import java.util.List;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> goodsList(String category, int page);
	public GoodsVO getGoods(String gcode);
	public List<GoodsVO> searchList(String keyword);
	public int totalCnt();
}
