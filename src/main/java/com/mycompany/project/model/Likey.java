package com.mycompany.project.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Likey {
	private static final Logger LOGGER= 
			LoggerFactory.getLogger(Likey.class);
	
	private String lkoid;
	private int lkpno;
	private int lkkey;
	private int lkcount;
	public Likey() {
		LOGGER.info("실행");
	}
	
	public int getLkcount() {
		return lkcount;
	}

	public void setLkcount(int lkcount) {
		this.lkcount = lkcount;
	}

	public String getLkoid() {
		return lkoid;
	}
	public void setLkoid(String lkoid) {
		this.lkoid = lkoid;
	}
	public int getLkpno() {
		return lkpno;
	}
	public void setLkpno(int lkpno) {
		this.lkpno = lkpno;
	}
	public int getLkkey() {
		return lkkey;
	}
	public void setLkkey(int lkkey) {
		this.lkkey = lkkey;
	}
	
}