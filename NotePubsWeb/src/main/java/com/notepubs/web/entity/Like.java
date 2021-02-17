package com.notepubs.web.entity;

import java.util.Date;

public class Like {
	private int memberId;
	private int noteId;
	private Date regDate;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(Date regDate, int memberId, int noteId) {
		super();
		this.regDate = regDate;
		this.memberId = memberId;
		this.noteId = noteId;
	}

	@Override
	public String toString() {
		return "Like [regDate=" + regDate + ", memberId=" + memberId + ", noteId=" + noteId + "]";
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
