package com.yedam.goods.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.goods.vo.GoodsVO;

public interface GoodsMapper {
	public List<GoodsVO> selectList(@Param("category") String category, @Param("page") int page, @Param("sort") String sort);
	public GoodsVO selectOne(String gcode);
	public List<GoodsVO> selectSearch(@Param("keyword") String keyword, @Param("page") int page);
	public int selectCount(@Param("category") String category, @Param("keyword") String keyword);
	public List<GoodsVO> selectRecommend(@Param("category") String category, @Param("num") int num);
}
