package com.yedam.review.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewCode;
	private String goodsCode;
	private String memberCode;
	private String memberName;
	private String title;
	private String content;
	private int stars;
	private String reviewDate;
	private int rn;
}
