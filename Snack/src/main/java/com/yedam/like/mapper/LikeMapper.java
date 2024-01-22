package com.yedam.like.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.like.vo.LikeVO;

public interface LikeMapper {
	//찜 목록
	List<LikeVO> selectList(String memberCode);
	
	//찜 추가
	int insertLike(LikeVO vo);
	
	//찜 추가 중복체크
	LikeVO checkLike(LikeVO vo);
	
	//찜 삭제
	int deleteLike(@Param("goodsCode") String goodsCode,  @Param("memberCode") String memberCode);
}
