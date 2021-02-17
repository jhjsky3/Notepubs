package com.notepubs.web.entity;

import java.util.Date;

public class Note {
	private int id;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	private int order;
	private boolean pub;
	private int mycategoryId;
    private int memberId;
    private int platformId;
    private int languageId;
    private int categoryId;    

	private String thumbImg;
	
	public Note() {
		// TODO Auto-generated constructor stub
	}
	
	public Note(int memberId, String title, String content) {
		
		this.title = title;
		this.content = content;
		this.memberId = memberId;
	}

	public Note(int id, String title, String content, Date regDate, int hit, int order, boolean pub,
			int mycategoryId, int memberId, int platformId, int languageId, int categoryId) {
		
		this.id = id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
		this.order = order;
		this.pub = pub;
		this.mycategoryId = mycategoryId;
		this.memberId = memberId;
		this.platformId = platformId;
		this.languageId = languageId;
		this.categoryId = categoryId;
	}
	

	@Override
	public String toString() {
		return "Note [id=" + id + ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", hit=" + hit
				+ ", order=" + order + ", pub=" + pub + ", mycategoryId=" + mycategoryId + ", memberId=" + memberId
				+ ", platformId=" + platformId + ", languageId=" + languageId + ", categoryId=" + categoryId
				+ ", thumbImg=" + thumbImg + "]";
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public boolean getPub() {
		return pub;
	}

	public void setPub(boolean pub) {
		this.pub = pub;
	}

	public int getMycategoryId() {
		return mycategoryId;
	}

	public void setMycategoryId(int mycategoryId) {
		this.mycategoryId = mycategoryId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getPlatformId() {
		return platformId;
	}

	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}

	public int getLanguageId() {
		return languageId;
	}

	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	
}