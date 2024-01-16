package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.review.command.AddReviewControl;
import com.yedam.review.command.AddReviewFormControl;
import com.yedam.review.command.GetReviewControl;
import com.yedam.review.command.ModReviewControl;
import com.yedam.review.command.ModReviewFormControl;
import com.yedam.review.command.RemReviewControl;
import com.yedam.review.command.ReviewListControl;

public class AFrontController extends HttpServlet{
	// 김현준
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		map.put("/reviewList.do", new ReviewListControl()); 		// 리뷰 목록 조회
		map.put("/getReview.do", new GetReviewControl());  			// 리뷰 단건 조회
		map.put("/addReviewForm.do", new AddReviewFormControl());	// 리뷰 추가 폼 이동
		map.put("/addReview.do", new AddReviewControl());			// 리뷰 추가 기능
		map.put("/modReviewForm.do", new ModReviewFormControl());	// 리뷰 수정 폼 이동
		map.put("/modReview.do", new ModReviewControl());			// 리뷰 수정 기능
		map.put("/remReview.do", new RemReviewControl());			// 리뷰 삭제 기능
			
		return map;
	}
}
