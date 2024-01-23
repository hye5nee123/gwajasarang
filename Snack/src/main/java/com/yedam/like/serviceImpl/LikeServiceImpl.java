package com.yedam.like.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.like.mapper.LikeMapper;
import com.yedam.like.service.LikeService;
import com.yedam.like.vo.LikeVO;


public class LikeServiceImpl implements LikeService {
	SqlSession session = DataSource.getInstance().openSession(true);
	LikeMapper mapper = session.getMapper(LikeMapper.class);
	
	@Override
	public List<LikeVO> selectList(String memberCode) {
		return mapper.selectList(memberCode);
	}

	@Override
	public boolean addLike(LikeVO vo) {
		// 찜목록 데이터 체크
	    LikeVO checkLike = mapper.checkLike(vo);
	    if (checkLike != null) {
	        return false; 
	    }
	    return mapper.insertLike(vo) == 1;
	}

	@Override
	public boolean remLike(String goodsCode, String memberCode) {
		return mapper.deleteLike(goodsCode, memberCode) == 1;
	}
}
