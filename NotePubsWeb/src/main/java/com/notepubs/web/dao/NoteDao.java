package com.notepubs.web.dao;

import java.util.List;

import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;

public interface NoteDao {
	
	Note get(int id);
	Note getPrev(int id);
	Note getNext(int id);
	NoteView getView(int id);
	
	List<NoteView> getHitTopViewList();
	List<NoteView> getNewViewList();
	
	List<NoteView> getViewList();
	List<NoteView> getPubViewList();
	List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId);
	List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId,
			int offset, int size);

	List<Note> getList();
	List<Note> getList(String title);
	List<Note> getList(String title, int myCategoryId);
	List<Note> getList(String title, int myCategoryId, int categoryId);
	List<Note> getList(String title, int myCategoryId, int categoryId, int languageId);
	List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId);
	List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId,int offSet, int size, String orderColumn, boolean pub);
	List<Note> getList(int offSet, int size, String orderColumn, boolean pub);

	int insert(Note note);
	int update(Note note);
	int delete(int id);
	
	//----------- 홍준이가 필요한 메소드
	List<NoteView> getViewListByWriterId(String writerId);
	int getPub(int id);
	int pubAll(int[] ids);

}
