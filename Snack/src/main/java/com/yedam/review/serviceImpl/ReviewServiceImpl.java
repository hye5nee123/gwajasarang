package com.yedam.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.mapper.ReviewMapper;
import com.yedam.review.service.ReviewService;
import com.yedam.review.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{

	SqlSession session =DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	
	@Override
	public List<ReviewVO> reviewList(String goodsCode) {
		return mapper.selectList(goodsCode);
	}

	@Override
	public ReviewVO getReview(int reviewCode) {
		return mapper.selectOne(reviewCode);
	}

	@Override
	public boolean addReview(ReviewVO vo) {
		return mapper.insertReview(vo) == 1;
	}

	@Override
	public boolean modReview(ReviewVO vo) {
		return mapper.updateReview(vo) == 1;
	}

	@Override
	public boolean remReview(int reviewCode) {
		return mapper.deleteReview(reviewCode) == 1;
	}

	@Override
	public List<ReviewVO> reviewListPaging(String goodsCode, int page) {
		return mapper.selectListPaging(goodsCode, page);
	}

	@Override
	public int getTotalCnt(String goodsCode) {
		return mapper.selectCount(goodsCode);
	}

}
