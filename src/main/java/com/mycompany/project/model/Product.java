package com.mycompany.project.model;


public class Product 
{
	private int pno;
	private String pname;
	private int pprice;
	private int pamount;
	private String pcompany;
	private String pcolor;
	private int plike;
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	private String pcontent;
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPamount() {
		return pamount;
	}
	public void setPamount(int pamount) {
		this.pamount = pamount;
	}
	
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	

}
