package com.mycompany.project.model;

import java.util.Date;

public class Orderby 
{
	private String oid;
	private int opno;
	private int oamount;
	private int ototalprice;
	
	public int getOtotalprice() {
		return ototalprice;
	}
	public void setOtotalprice(int ototalprice) {
		this.ototalprice = ototalprice;
	}
	private String opay;
	private Date odate;
	private int okey;
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	
	public int getOpno() {
		return opno;
	}
	public void setOpno(int opno) {
		this.opno = opno;
	}
	public int getOamount() {
		return oamount;
	}
	public void setOamount(int oamount) {
		this.oamount = oamount;
	}
	public String getOpay() {
		return opay;
	}
	public void setOpay(String opay) {
		this.opay = opay;
	}
	
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public int getOkey() {
		return okey;
	}
	public void setOkey(int okey) {
		this.okey = okey;
	}

	
	
}
