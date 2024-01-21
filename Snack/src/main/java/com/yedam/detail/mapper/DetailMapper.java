package com.yedam.detail.mapper;

import java.util.List;

import com.yedam.detail.vo.DetailVO;

public interface DetailMapper {
	List<DetailVO> selectDetail(String detailCode);
	int insertDetail(DetailVO vo);
}
