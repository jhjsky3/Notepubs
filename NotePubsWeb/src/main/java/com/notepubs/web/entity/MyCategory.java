package com.notepubs.web.entity;

public class MyCategory {
	
	private int id;
	private int memberId;	
	private String name;
	
	public MyCategory() {
		// TODO Auto-generated constructor stub
	}

	public MyCategory(int id, String name, int memberId) {
		super();
		this.id = id;
		this.name = name;
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "MyCategory [id=" + id + ", name=" + name + ", memberId=" + memberId + "]";
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

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	
	

}
