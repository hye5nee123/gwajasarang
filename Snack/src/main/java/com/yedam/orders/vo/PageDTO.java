package com.yedam.orders.vo;

import lombok.Data;

@Data
public class PageDTO {
	private int currPage;
	private int totalCnt;
	private boolean prev, next;
	private int startPage, lastPage;
	
	//생성자: 전체건수, 현재 페이지
		public PageDTO(int page, int totalCnt) {
			this.currPage = page;
			this.totalCnt = totalCnt;
			
			//이전페이지 여부, 첫페이지, 마지막 페이지, 이후페이지 여부.
			//전체건수: 70건. 14페이지.
			int realLast = (int)Math.ceil(totalCnt / 5.0);
			
			this.lastPage = (int)Math.ceil(page / 5.0) * 5;
			
			this.startPage = this.lastPage - 4;		
			this.lastPage = this.lastPage > realLast ? realLast : this.lastPage;
			//이전페이지 
			this.prev = this.startPage > 1;
			//이후 페이지
			this.next = this.lastPage < realLast;
			
		}


		@Override
		public String toString() {
			return "PageDTO [currPage=" + currPage + ", totalCnt=" + totalCnt + ", prev=" + prev + ", next=" + next
					+ ", startPage=" + startPage + ", lastPage=" + lastPage + "]";
		}
		
	
	
}
