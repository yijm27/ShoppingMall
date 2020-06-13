package com.mycompany.project.model;

import java.util.Date;

public class Basket 
{
	private String bkoid;
	private int bkpno;
	private int bkkey;
	private int bkprice;
	
	public int getBkprice() {
		return bkprice;
	}
	public void setBkprice(int bkprice) {
		this.bkprice = bkprice;
	}
	public String getBkoid() {
		return bkoid;
	}
	public void setBkoid(String bkoid) {
		this.bkoid = bkoid;
	}
	public int getBkpno() {
		return bkpno;
	}
	public void setBkpno(int bkpno) {
		this.bkpno = bkpno;
	}

	public int getBkkey() {
		return bkkey;
	}
	public void setBkkey(int bkkey) {
		this.bkkey = bkkey;
	}
}
