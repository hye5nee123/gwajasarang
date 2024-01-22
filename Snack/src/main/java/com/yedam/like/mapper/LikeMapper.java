package com.yedam.like.mapper;

public interface LikeMapper {
	//찜 목록
	List<LikeVO> selectList(String memberCode);
	
	//찜 추가
	int insertLike(LikeVO vo);
	
	//찜 추가 중복체크
	LikeVO checkLikeIt(LikeVO vo);
	
	//찜 삭제
	int deleteLike(@Param("goodsCode") String goodsCode,  @Param("memberCode") String memberCode);
}
