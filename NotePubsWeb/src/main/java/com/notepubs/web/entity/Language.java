package com.notepubs.web.entity;

import java.util.Date;
import java.util.List;

public class Language {

	private int id;
	private String name;
	private Date release;
	private int memberId;
	private int categoryId;
	private List<Platform> platforms;
	
	public Language() {
	
	}

	public Language(int id, String name, Date release, int memberId, int categoryId) {
		super();
		this.id = id;
		this.name = name;
		this.release = release;
		this.memberId = memberId;
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "Language [id=" + id + ", name=" + name + ", release=" + release + ", memberId=" + memberId
				+ ", categoryId=" + categoryId + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRelease() {
		return release;
	}

	public void setRelease(Date release) {
		this.release = release;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public List<Platform> getPlatforms() {
		return platforms;
	}

	public void setPlatforms(List<Platform> platforms) {
		this.platforms = platforms;
	}

	
	
	
	
}
