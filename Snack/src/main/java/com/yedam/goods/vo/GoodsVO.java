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
	private double weight;
	private String unit;
	private String allergy;
	private double calorie;
	private double na;
	private double carbo;
	private double sugar;
	private double sfat;
	private double protein;
	private int viewPage = 1;
	private int count;
}