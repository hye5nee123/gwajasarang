package com.yedam.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import com.yedam.review.command.AddReviewControl;
import com.yedam.review.command.AddReviewFormControl;
import com.yedam.review.command.GetReviewAjax;
import com.yedam.review.command.GetReviewControl;
import com.yedam.review.command.GetReviewJson;
import com.yedam.review.command.ModReviewControl;
import com.yedam.review.command.ModReviewFormControl;
import com.yedam.review.command.RemReviewControl;
import com.yedam.review.command.ReviewCountJson;
import com.yedam.review.command.ReviewListAjax;
import com.yedam.review.command.ReviewListControl;
import com.yedam.review.command.ReviewListJson;

public class AFrontController extends HttpServlet{
	// 김현준
	Map<String, Control> map = new HashMap<>();
	
	Map<String, Control> getMap(){
		// JSP
		map.put("/reviewList.do", new ReviewListControl()); 		// 목록 조회
		map.put("/getReview.do", new GetReviewControl());  			// 단건 조회
		map.put("/addReviewForm.do", new AddReviewFormControl());	// 추가 폼 이동
		map.put("/addReview.do", new AddReviewControl());			// 추가 기능
		map.put("/modReviewForm.do", new ModReviewFormControl());	// 수정 폼 이동
		map.put("/modReview.do", new ModReviewControl());			// 수정 기능
		map.put("/remReview.do", new RemReviewControl());			// 삭제 기능
		
		// AJAX
		map.put("/reviewListJson.do", new ReviewListJson());			// JSON 생성
		map.put("/reviewListAjax.do", new ReviewListAjax());			// AJAX 목록 조회
		map.put("/getReviewJson.do", new GetReviewJson());				// AJAX 목록 조회
		map.put("/getReviewAjax.do", new GetReviewAjax());				// AJAX 목록 조회
		map.put("/reviewCountJson.do", new ReviewCountJson());
		
		return map;
	}
}
