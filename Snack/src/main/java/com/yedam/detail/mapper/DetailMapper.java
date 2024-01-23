package com.yedam.detail.mapper;

import java.util.List;

import com.yedam.detail.vo.DetailVO;

public interface DetailMapper {
	List<DetailVO> selectDetail(String orderCode);
	int insertDetail(String orderCode);
	DetailVO selectOne(String detailCode);

}
