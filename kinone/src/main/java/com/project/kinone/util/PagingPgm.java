package com.project.kinone.util;

public class PagingPgm {
	private int total;
	private int rowPerPage;
	private int pagePerBlk = 10;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int startRow;
	private int endRow;
	private int no;
	
	public PagingPgm(int total, int rowPerPage, int currentPage) {
		this.total = total;
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		
		totalPage= (int) Math.ceil((double)total/rowPerPage);
		startPage=currentPage -(currentPage-1)%pagePerBlk;
		endPage =startPage+pagePerBlk -1;
		
		if(endPage>totalPage)
			endPage=totalPage;
		
		this.startRow =(currentPage -1)*rowPerPage+1;
		this.endRow = startRow + rowPerPage-1;
		this.no = total-startRow + 1;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getPagePerBlk() {
		return pagePerBlk;
	}

	public void setPagePerBlk(int pagePerBlk) {
		this.pagePerBlk = pagePerBlk;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "PagingPgm [total=" + total + ", rowPerPage=" + rowPerPage + ", pagePerBlk=" + pagePerBlk
				+ ", currentPage=" + currentPage + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", startRow=" + startRow + ", endRow=" + endRow + ", no=" + no + "]";
	}
}
