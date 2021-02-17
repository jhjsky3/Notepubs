package com.notepubs.web.entity;

public class PlatformView extends Platform {

	private String categoryName;
	private int languageId;
	private int platformId;
	
	public PlatformView() {
		// TODO Auto-generated constructor stub
	}

	public PlatformView(int id, String name, String relaseDate, int memberId,
						String categoryName, int languageId, int platformId) {
		
		super(id, name, relaseDate, memberId);
		
		this.categoryName = categoryName;
		this.languageId = languageId;
		this.platformId = platformId;
	}

	@Override
	public String toString() {
		return "PlatformView [categoryName=" + categoryName + ", languageId=" + languageId + ", platformId="
				+ platformId + "]";
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getLanguageId() {
		return languageId;
	}

	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}

	public int getPlatformId() {
		return platformId;
	}

	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}
	
}
