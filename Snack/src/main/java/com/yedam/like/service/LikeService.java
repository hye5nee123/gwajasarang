package com.yedam.like.service;

public interface LikeService {
	//찜 목록
	public List<LikeVO> selectList(String memberCode);
	
	//찜 추가
	public int addLike(LikeVO vo);
	
		
	//찜 삭제
	public boolean remLike(String goodsCode, String memberCode);
}
