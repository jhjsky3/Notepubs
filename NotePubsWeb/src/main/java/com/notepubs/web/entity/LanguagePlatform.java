package com.notepubs.web.entity;

public class LanguagePlatform {
	
	private int languageId;
	private int platformId;
	
	public LanguagePlatform() {
		// TODO Auto-generated constructor stub
	}

	public LanguagePlatform(int languageId, int platformId) {
		super();
		this.languageId = languageId;
		this.platformId = platformId;
	}

	@Override
	public String toString() {
		return "LanguagePlatform [languageId=" + languageId + ", platformId=" + platformId + "]";
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
