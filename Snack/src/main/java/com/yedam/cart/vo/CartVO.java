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
	private String name;
	private int price;
	private String img;
	private int totalPrice;
	private String putDate;

	

	public CartVO(int cartCode, String goodsCode, String memberCode, int quantity) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatedNow = now.format(formatter);
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = this.price * this.quantity;
		this.putDate = formatedNow;
	
	}
}
