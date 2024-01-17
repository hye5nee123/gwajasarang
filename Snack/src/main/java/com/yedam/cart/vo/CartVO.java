package com.yedam.cart.vo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class CartVO {
	// 테이블에 있음.
	private int cartCode;
	private String goodsCode;
	private String memberCode;
	private int quantity;

	// 테이블에 없음.
	private String goodsName;
	private int price;
	private String thumbImage;
	private int totalPrice;
	private String putDate;

}
