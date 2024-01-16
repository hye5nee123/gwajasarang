package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.review.command.AddReviewControl;
import com.yedam.review.command.AddReviewFormControl;
import com.yedam.review.command.GetReviewControl;
import com.yedam.review.command.ModReviewControl;
import com.yedam.review.command.ModReviewFormControl;
import com.yedam.review.command.ReviewListControl;

public class AFrontController extends HttpServlet{
	// 김현준
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/reviewList.do", new ReviewListControl()); // 리뷰 목록
		map.put("/getReview.do", new GetReviewControl());  // 리뷰 단건조회
		map.put("/addReviewForm.do", new AddReviewFormControl());	// 리뷰 추가 페이지 이동
		map.put("/addReview.do", new AddReviewControl());
		map.put("/modReview.do", new ModReviewControl());
		map.put("/modReviewForm.do", new ModReviewFormControl());
		
		return map;
	}
}
