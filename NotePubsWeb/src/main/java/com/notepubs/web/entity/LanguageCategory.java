package com.notepubs.web.entity;

public class LanguageCategory {
	
	private int id;
	private String name;
	
	public LanguageCategory() {
		// TODO Auto-generated constructor stub
	}

	public LanguageCategory(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public String toString() {
		return "LanguageCategory [id=" + id + ", name=" + name + "]";
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
	
	
}
