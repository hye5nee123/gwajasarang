package com.yedam.common;

import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class MainExe {

	public static void main(String[] args) {
		
		String orderCodeStr = "O-" + String.format("%05d",20);
		System.out.println(orderCodeStr);
	}

}
