package com.notepubs.web.entity;

import java.util.Date;

public class MemberView extends Member {
	private int notePubCnt;
	private int noteAllCnt;
	private int bookAllCnt;
	private int bookPubCnt;
		
	public MemberView() {
		// TODO Auto-generated constructor stub
	}

	public MemberView(
			int id, String name, String password, 
			String nicname, String email, String phone,
			String address,	String gender, Date regdate,
			int notePubCnt,int noteAllCnt,int bookAllCnt,int bookPubCnt) {
		super(id, name, password, nicname, email, phone, address,
				gender, regdate);
	
}

	public int getNotePubCnt() {
		return notePubCnt;
	}

	public void setNotePubCnt(int notePubCnt) {
		this.notePubCnt = notePubCnt;
	}

	public int getNoteAllCnt() {
		return noteAllCnt;
	}

	public void setNoteAllCnt(int noteAllCnt) {
		this.noteAllCnt = noteAllCnt;
	}

	public int getBookAllCnt() {
		return bookAllCnt;
	}

	public void setBookAllCnt(int bookAllCnt) {
		this.bookAllCnt = bookAllCnt;
	}

	public int getBookPubCnt() {
		return bookPubCnt;
	}

	public void setBookPubCnt(int bookPubCnt) {
		this.bookPubCnt = bookPubCnt;
	}
}