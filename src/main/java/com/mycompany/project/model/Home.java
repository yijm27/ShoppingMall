package com.mycompany.project.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Home {
	private int hno;
	private String htitle;
	private int hpno;
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHtitle() {
		return htitle;
	}
	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}
	public int getHpno() {
		return hpno;
	}
	public void setHpno(int hpno) {
		this.hpno = hpno;
	}
	
}
