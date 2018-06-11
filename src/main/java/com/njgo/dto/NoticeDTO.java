package com.njgo.dto;

import java.sql.Date;

public class NoticeDTO{
	
	private int num;
	private String writer;
	private String title;
	private String contents;
	private Date regdate;
	private int hit;
	private String rep_pic;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRep_pic() {
		return rep_pic;
	}
	public void setRep_pic(String rep_pic) {
		this.rep_pic = rep_pic;
	}

}
