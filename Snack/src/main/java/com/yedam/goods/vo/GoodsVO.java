package com.yedam.goods.vo;

import lombok.Data;

@Data
public class GoodsVO {
	private String goodsCode;
	private String goodsName;
	private String company;
	private int price;
	private String category;
	private String thumbImage;
	private String detailImage;
}
