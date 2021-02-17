package com.notepubs.web.service;

import java.util.List;

import com.notepubs.web.entity.Category;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.entity.Platform;

public interface NoteService {
   
   int insert(Note note);
   int update(Note note);
   int delete(int id);
   
   NoteView getView(int id);
   Note get(int id);
   int hitUp(int id);
   
   List<Note> getList();
   List<MyCategory> getMyCategoryList();
   List<Category> getCategoryList();
   List<Language> getLanguageList();
   List<Note> getList(String title);
   List<Platform> getPlatformList();
   List<Note> getList(String title, int myCategoryId);
   List<Note> getList(String title, int myCategoryId, int categoryId);
   List<Note> getList(String title, int myCategoryId, int categoryId, int languageId);
   List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId);
   List<NoteView> getViewList();
   
   List<NoteView> getHitTopViewList();
   List<NoteView> getNewViewList();
   List<NoteView> getPubViewList();
   Note getPrev(int id);
   Note getNext(int id);
   List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId);
   List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId,
         int offset, int size);
   
   //-- 홍준이............ 코드
   List<NoteView> getViewListByWriterId(String writerId);
   List<MyCategory> getMyCategoryListByMemberId(int memberId);
   
   public int deleteAll(int[] ides);
   int getMemberId(String writerId);
   int pub(int id, boolean status);
   int pubAll(int[] ids);
   int getPub(int id);
   
   int insert(int memberId, String writerId, String title, String content);
   int likeUp(int noteId, int memberId);
   boolean hasLike(int noteId, int memberId);
   
   
}








