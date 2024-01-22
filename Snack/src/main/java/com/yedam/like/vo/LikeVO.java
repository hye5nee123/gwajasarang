package com.yedam.like.vo;

import lombok.Data;

@Data
public class LikeVO {
	private int likesCode; 
	private String goodsCode;
	private String memberCode;
	private String goodsName;
	private String thumbImage;
	private String price;
}
