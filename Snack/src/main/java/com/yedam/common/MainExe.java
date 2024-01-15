package com.yedam.common;

import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;

public class MainExe {

	public static void main(String[] args) {
		
		String reviewCode = "2";
		
		ReviewService svc = new ReviewServiceImpl();
		ReviewVO vo = svc.getReview(Integer.parseInt(reviewCode));
	
		System.out.println(vo);
	}

}
