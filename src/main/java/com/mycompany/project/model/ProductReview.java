package com.mycompany.project.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductReview {
	private int rpno;//ono
	private String rcontents;// 추가 내용
	private String rwriter;//mid oid
	private Date rdate; //new date(3)
	private MultipartFile rfile; //후기 파일 업로드 하도록
	private String rsname;
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
	}
	public String getRcontents() {
		return rcontents;
	}
	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public MultipartFile getRfile() {
		return rfile;
	}
	public void setRfile(MultipartFile rfile) {
		this.rfile = rfile;
	}
	public String getRsname() {
		return rsname;
	}
	public void setRsname(String rsname) {
		this.rsname = rsname;
	}
	
	
}
