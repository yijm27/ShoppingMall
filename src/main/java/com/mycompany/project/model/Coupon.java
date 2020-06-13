package com.mycompany.project.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Coupon {
	private static final Logger LOGGER= 
			LoggerFactory.getLogger(Coupon.class);
	
	private int cno;
    private String cmid;
    private int cvalue;
    
	public Coupon() {
		LOGGER.info("실행");
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCmid() {
		return cmid;
	}

	public void setCmid(String cmid) {
		this.cmid = cmid;
	}

	public int getCvalue() {
		return cvalue;
	}

	public void setCvalue(int cvalue) {
		this.cvalue = cvalue;
	}
		
}