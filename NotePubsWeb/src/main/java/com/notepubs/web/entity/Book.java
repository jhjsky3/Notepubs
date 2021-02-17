package com.notepubs.web.entity;

import java.util.Date;

public class Book {

	private int id;
	private String title;
	private String content;
	private String writerId;
	private Date regDate;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(int id, String title, String content, String writerId, Date regDate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", content=" + content + ", writerId=" + writerId + ", regDate="
				+ regDate + "]";
	}
	
	
}
