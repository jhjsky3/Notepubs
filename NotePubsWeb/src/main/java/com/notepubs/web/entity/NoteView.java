package com.notepubs.web.entity;

import java.util.Date;

public class NoteView extends Note{
	
	private String writerId;
	private int bookMarkCount;		      
	private int likeCount;
	
	public NoteView() {
		// TODO Auto-generated constructor stub
	}
	
	public NoteView(int id, String title, String content, String writerId, Date regDate, int hit, int order,
			boolean pub, int mycategoryId, int memberId, int platformId, int languageId, int categoryId,int bookMarkCount, int likeCount) {
		super(id, title, content, regDate, hit, order, pub, mycategoryId, memberId, platformId, languageId,
				categoryId);

		this.writerId = writerId;
		this.bookMarkCount = bookMarkCount;
		this.likeCount = likeCount;
		// TODO Auto-generated constructor stub
	}
	
	
	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public int getBookMarkCount() {
		return bookMarkCount;
	}

	public void setBookMarkCount(int bookMarkCount) {
		this.bookMarkCount = bookMarkCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "NoteView [writerId=" + writerId + ", bookMarkCount=" + bookMarkCount + ", likeCount=" + likeCount
				+ ", toString()=" + super.toString() + "]";
	}


	
	


}
