package com.njgo.dto;

public class RankingDTO{
	
	private int num;
	private int hit;
	private int scrap;
	private String regdate;
	private String foodname;
	private String writer;
	private String rep_pic;
	private int rownum;
	private int totalhit;
	private int totalscrap;
	
	public int getTotalhit() {
		return totalhit;
	}
	public void setTotalhit(int totalhit) {
		this.totalhit = totalhit;
	}
	public int getTotalscrap() {
		return totalscrap;
	}
	public void setTotalscrap(int totalscrap) {
		this.totalscrap = totalscrap;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getRep_pic() {
		return rep_pic;
	}
	public void setRep_pic(String rep_pic) {
		this.rep_pic = rep_pic;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
}
