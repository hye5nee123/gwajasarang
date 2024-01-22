package com.yedam.goods.service;

import java.util.List;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> goodsList(String category, int page, String sort);
	public GoodsVO getGoods(String gcode);
	public List<GoodsVO> searchList(String keyword, int page);
	public int totalCnt(String category, String keyword);
	public List<GoodsVO> recommendList(String category, int num);
}
