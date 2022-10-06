package com.beans;

public class Paging {
	
	   private int page = 1;
	   private int totalCount;
	   private int beginPage;
	   private int endPage;
	   private int displayRow = 8;
	   private int displayPage = 10;
	   boolean prev;
	   boolean next;
	   private int startNum;
	   private int endNum;
	   
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getStartNum() {
		startNum = (page -1) * displayRow + 1;
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		endNum = page*displayRow;
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	// 페이지 개수 구성
   private void paging() {
	      endPage = ((int)Math.ceil(page/(double)displayPage)) * displayPage;
	      System.out.println("endPage : " + endPage);
	      
	      beginPage = endPage - (displayPage - 1);
	      System.out.println("beginPage : " + beginPage);
	      
	      int totalPage = (int)Math.ceil(totalCount / (double)displayRow);
	      
	      if (totalPage < endPage) {
	         endPage = totalPage;
	         next = false;
	      } else {
	         next = true;
	      }
	      
	      prev = (beginPage == 1) ? false : true;
	      System.out.println("endPage : " + endPage);
	      System.out.println("total Page : " + totalPage);
	   }
	   
}
