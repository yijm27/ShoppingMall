package com.mycompany.project.model;

public class Pager {
	private int totalRows;		//전체행수
	private int totalPageNo;		//전체 페이지 수
	private int totalGroupNo;		//전체 그룹 수
	private int startPageNo;		//그룹의 시작 페이스 번호
	private int endPageNo;		//그룹의 끝 페이스 번호
	private int pageNo;		//현재 페이지 번호
	private int pagesPerGroup;	//그룹당 페이지 수
	private int groupNo;		//현재 그룹 번호
	private int rowsPerPage;	//페이지당 행수 
	
	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPageNo() {
		return totalPageNo;
	}

	public void setTotalPageNo(int totalPageNo) {
		this.totalPageNo = totalPageNo;
	}

	public int getTotalGroupNo() {
		return totalGroupNo;
	}

	public void setTotalGroupNo(int totalGroupNo) {
		this.totalGroupNo = totalGroupNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPagesPerGroup() {
		return pagesPerGroup;
	}

	public void setPagesPerGroup(int pagesPerGroup) {
		this.pagesPerGroup = pagesPerGroup;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public Pager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
		this.rowsPerPage= rowsPerPage;
		this.pagesPerGroup=pagesPerGroup;
		this.totalRows=totalRows;
		this.pageNo=pageNo;
		totalPageNo= totalRows/rowsPerPage;
		if(totalRows%rowsPerPage!=0) totalPageNo++;
		
		totalGroupNo= totalPageNo/pagesPerGroup;
		if(totalPageNo%pagesPerGroup!=0) totalGroupNo++;
		
		
		groupNo=(pageNo-1)/pagesPerGroup+1;
		
		startPageNo= (groupNo-1)*pagesPerGroup+1;
		endPageNo=startPageNo+pagesPerGroup-1;
		if(groupNo == totalGroupNo) endPageNo = totalPageNo;
	}
	
}
