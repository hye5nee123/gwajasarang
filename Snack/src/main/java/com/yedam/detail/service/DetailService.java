package com.yedam.detail.service;

import java.util.List;

import com.yedam.detail.vo.DetailVO;

public interface DetailService {
	public List<DetailVO> detailList(String orderCode);
	public boolean addDetail(String orderCode);
	public DetailVO getDetail(String detailCode);
}
