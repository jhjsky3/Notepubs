package com.notepubs.web.entity;

import java.util.Date;

public class Member {
	private int id;
	private String name;
	private String password;
	private String nicname;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private Date regdate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int id, String name, String password, String nicname, String email, String phone, String address,
			String gender, Date regdate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.nicname = nicname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", password=" + password + ", nicname=" + nicname + ", email="
				+ email + ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", regdate=" + regdate
				+ "]";
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	
}
