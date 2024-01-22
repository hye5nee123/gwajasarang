package com.yedam.detail.vo;

import lombok.Data;

@Data
public class DetailVO {
	private String detailCode;
	private String orderCode;
	private String goodsCode;
	private int quantity;
	private int detailPrice;
	private String goodsName;
	private int reviewCode;
}
