package com.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.review.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> selectList(@Param("goodsCode") String goodsCode);
	ReviewVO selectOne(@Param("reviewCode") int reviewCode);
	int insertReview(ReviewVO vo);
	int updateReview(ReviewVO vo);
	int deleteReview(int reviewCode);
	List<ReviewVO> selectListPaging(@Param("goodsCode") String goodsCode, @Param("page") int page);
}
