package com.notepubs.web.entity;

import java.util.Date;

public class BookMark {
	
	private Date regDate;
	private int memberId;
	private int noteId;
	
	public BookMark() {
		// TODO Auto-generated constructor stub
	}

	public BookMark(Date regDate, int memberId, int noteId) {
		super();
		this.regDate = regDate;
		this.memberId = memberId;
		this.noteId = noteId;
	}

	@Override
	public String toString() {
		return "BookMark [regDate=" + regDate + ", memberId=" + memberId + ", noteId=" + noteId + "]";
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}



	
	
	
	
}
