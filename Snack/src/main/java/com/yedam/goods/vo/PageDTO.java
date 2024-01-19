package com.yedam.goods.vo;

import lombok.Data;

@Data
public class PageDTO {
	private int currPage;	// 현재 페이지
	private int totalCnt;	// 전체 게시물 수
	private boolean prev, next;	// 이전 페이지, 다음 페이지 존재유무
	private int startPage, lastPage;	// 시작 페이지, 끝 페이지
	private int pageUnit = 12;  // 출력할 상품 수
	private int pageSize = 5;	// 출력할 페이지 번호 수
	
	public PageDTO(int page, int totalCnt) {
		this.currPage = page;
		this.totalCnt = totalCnt;
		
		int realLast = (int) Math.ceil(totalCnt / (double) pageUnit);
		this.lastPage = (int) Math.ceil(page / (double) pageSize) * pageSize;
		this.lastPage = (this.lastPage > realLast)? realLast : this.lastPage;
//		this.startPage = this.lastPage - pageSize + 1;
		this.startPage = (this.lastPage - pageSize + 1 < 0)? 1 : this.lastPage - pageSize + 1;
		
		this.prev = this.startPage > 1;
		this.next = this.lastPage < realLast;
	}
}
