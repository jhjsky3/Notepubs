package com.notepubs.web.entity;

import java.util.List;

public class PlatformCategory {
	
	private int id;
	private String name;
	
	
	public PlatformCategory() {
		// TODO Auto-generated constructor stub
	}


	public PlatformCategory(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	@Override
	public String toString() {
		return "PlatformCategory [id=" + id + ", name=" + name + "]";
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
