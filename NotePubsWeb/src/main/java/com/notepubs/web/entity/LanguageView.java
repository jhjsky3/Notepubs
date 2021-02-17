package com.notepubs.web.entity;

import java.util.Date;

public class LanguageView extends Language {
	
	private String categoryName;
	
	public LanguageView() {
		// TODO Auto-generated constructor stub
	}

	public LanguageView(int id, String name, Date release,
			int memberId, int categoryId,String categoryName) {
		
		super(id, name, release, memberId, categoryId);
		this.categoryName = categoryName;
		
	}

	@Override
	public String toString() {
		return "LanguageView [categoryName=" + categoryName + "]";
	}

	public String getcategoryName() {
		return categoryName;
	}

	public void setcategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
