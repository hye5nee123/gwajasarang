package com.yedam.review.service;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(String goodsCode);
	public ReviewVO getReview(int reviewCode);
	public boolean addReview(ReviewVO vo);
	public boolean modReview(ReviewVO vo);
	public boolean remReview(int reviewCode);
	public List<ReviewVO> reviewListPaging(String goodsCode, int page);
	int getTotalCnt(String goodsCode);
}
