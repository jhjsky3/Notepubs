package com.notepubs.web.entity;

import java.sql.Date;

public class Comment {

	private int id;
	private String title;
	private Date regDate;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int id, String title, Date regDate) {
		super();
		this.id = id;
		this.title = title;
		this.regDate = regDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", title=" + title + ", regDate=" + regDate + "]";
	}
	
}
