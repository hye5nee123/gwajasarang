package com.yedam.goods.mapper;

import java.util.List;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsMapper {
	public List<GoodsVO> selectList();
	public GoodsVO selectOne(String gcode);
	public List<GoodsVO> search(String gname);
}
