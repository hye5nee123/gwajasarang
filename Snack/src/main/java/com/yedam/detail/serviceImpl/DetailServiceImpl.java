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
	public List<DetailVO> detailList(String detailCode) {
		return mapper.selectDetail(detailCode);
	}

	@Override
	public boolean addDetail(DetailVO vo) {
		return mapper.insertDetail(vo) == 1;
	}

}
