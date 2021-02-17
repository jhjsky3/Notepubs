package com.notepubs.web.entity;

public class Platform {
	
	private int id;
	private String name;
	private String relaseDate;
	private int memberId;
	
	public Platform() {
		// TODO Auto-generated constructor stub
	}

	public Platform(int id, String name, String relaseDate, int memberId) {
		super();
		this.id = id;
		this.name = name;
		this.relaseDate = relaseDate;
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Platform [id=" + id + ", name=" + name + ", relaseDate=" + relaseDate + ", memberId=" + memberId + "]";
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

	public String getRelaseDate() {
		return relaseDate;
	}

	public void setRelaseDate(String relaseDate) {
		this.relaseDate = relaseDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	
	

}
