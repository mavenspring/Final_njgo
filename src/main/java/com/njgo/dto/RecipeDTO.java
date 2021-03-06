package com.njgo.dto;

import java.sql.Date;

public class RecipeDTO {
	private int num;
	private String writer;
	private String foodname;
	private String title;
	private int hit;
	private Date regdate;
	private String rep_pic;
	private int amount;
	private double rating;
	private String elapsedtime;
	private int scrap;
	private String r_intro;
	private int rownum;
	private int ct;
	private String myphoto;
	private String sns_photo;
	
	
	
	public String getSns_photo() {
		return sns_photo;
	}
	public void setSns_photo(String sns_photo) {
		this.sns_photo = sns_photo;
	}
	public String getR_intro() {
		return r_intro;
	}
	public void setR_intro(String r_intro) {
		this.r_intro = r_intro;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRep_pic() {
		return rep_pic;
	}
	public void setRep_pic(String rep_pic) {
		this.rep_pic = rep_pic;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getElapsedtime() {
		return elapsedtime;
	}
	public void setElapsedtime(String elapsedtime) {
		this.elapsedtime = elapsedtime;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getCt() {
		return ct;
	}
	public void setCt(int ct) {
		this.ct = ct;
	}
	public String getMyphoto() {
		return myphoto;
	}
	public void setMyphoto(String myphoto) {
		this.myphoto = myphoto;
	}
	
}
