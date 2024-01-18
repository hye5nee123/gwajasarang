package com.yedam.goods.vo;

import lombok.Data;

@Data
public class PageDTO {
	private int currPage;
	private int totalCnt;
	private boolean prev, next;
	private int startPage, lastPage;
	
	public PageDTO(int page, int totalCnt) {
		this.currPage = page;
		this.totalCnt = totalCnt;
		
		int realLast = (int) Math.ceil(totalCnt / 12.0);
		this.lastPage = (int) Math.ceil(page / 12.0) * 5;
		this.startPage = this.lastPage - 4;
		this.lastPage = (this.lastPage > realLast)? realLast : this.lastPage;
		
		this.prev = this.startPage > 1;
		this.next = this.lastPage < realLast;
	}
}
