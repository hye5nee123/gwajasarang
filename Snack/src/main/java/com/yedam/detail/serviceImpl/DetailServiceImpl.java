package com.yedam.detail.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.detail.mapper.DetailMapper;
import com.yedam.detail.service.DetailService;
import com.yedam.detail.vo.DetailVO;

public class DetailServiceImpl implements DetailService{

	SqlSession session = DataSource.getInstance().openSession(true);
	DetailMapper mapper = session.getMapper(DetailMapper.class);
	
	@Override
	public List<DetailVO> detailList(String orderCode) {
		return mapper.selectDetail(orderCode);
	}

	@Override
	public boolean addDetail(String orderCode) {
		return mapper.insertDetail(orderCode) >= 1;
	}

	@Override
	public DetailVO getDetail(String detailCode) {
		return mapper.selectOne(detailCode);
	}

}
