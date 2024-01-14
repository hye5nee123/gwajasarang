package com.yedam.goods.mapper;

import java.util.List;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsMapper {
	List<GoodsVO> selectList();
	GoodsVO selecOne(int gcode);
}
