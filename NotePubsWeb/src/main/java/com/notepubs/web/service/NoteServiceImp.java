package com.notepubs.web.service;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.CategoryDao;
import com.notepubs.web.dao.LanguageDao;
import com.notepubs.web.dao.LikeDao;
import com.notepubs.web.dao.MemberDao;
import com.notepubs.web.dao.MyCategoryDao;
import com.notepubs.web.dao.NoteDao;
import com.notepubs.web.dao.PlatformDao;
import com.notepubs.web.entity.Category;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.Like;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.entity.Platform;

@Service
public class NoteServiceImp implements NoteService {

	@Autowired
	private NoteDao noteDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MyCategoryDao myCategoryDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private LanguageDao languageDao;

	@Autowired
	private PlatformDao platformDao;
	
	@Autowired
	private LikeDao likeDao;

	@Override
	public List<Note> getList() {

		return noteDao.getList("");
	}

	@Override
	public List<Note> getList(String title) {

		return noteDao.getList(title);
	}

	@Override
	public int insert(Note note) {
		// TODO Auto-generated method stub
		return noteDao.insert(note);
	}

	@Override
	public int update(Note note) {
		// TODO Auto-generated method stub
		return noteDao.update(note);
	}

	@Override
	public int delete(int id) {

		return noteDao.delete(id);
	}

	@Override
	public Note get(int id) {
		// TODO Auto-generated method stub
		return noteDao.get(id);
	}

	@Override
	public NoteView getView(int id) {
		// TODO Auto-generated method stub
		return noteDao.getView(id);
	}

	@Override
	public List<MyCategory> getMyCategoryList() {
		// TODO Auto-generated method stub
		return myCategoryDao.getList();
	}

	@Override
	public List<Category> getCategoryList() {

		return categoryDao.getList();
	}

	@Override
	public List<Language> getLanguageList() {

		return languageDao.getList();
	}

	@Override
	public List<Platform> getPlatformList() {
		// TODO Auto-generated method stub
		return platformDao.getList();
	}

	@Override
	public List<Note> getList(String title, int myCategoryId) {
		// TODO Auto-generated method stub
		return noteDao.getList(title, myCategoryId);
	}

	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId) {
		// TODO Auto-generated method stub
		return noteDao.getList(title, myCategoryId, categoryId);
	}

	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId, int languageId) {
		// TODO Auto-generated method stub
		return noteDao.getList(title, myCategoryId, categoryId, languageId);
	}

	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId) {
		// TODO Auto-generated method stub
		return noteDao.getList(title, myCategoryId, categoryId, languageId, platformId);
	}

	@Override
	public List<NoteView> getViewList() {

		List<NoteView> list = noteDao.getViewList();

		for (NoteView n : list) {
			String content = n.getContent();

			if (content == null)
				continue;

			Document doc = Jsoup.parse(content);

			// 텍스트만 발췌하기
			String text = doc.text();
			if (text.length() > 250)
				text = text.substring(0, 249);

			n.setContent(text);

			// 첫번째 이미지 골라내기
			Elements imgs = doc.select("img");
			if (imgs.size() > 0) {
				// text += imgs.first().toString();
				n.setThumbImg(imgs.first().attr("src"));
			}

		}

		return list;
	}

	@Override
	public int hitUp(int id) {
		Note note = noteDao.getView(id);
		note.setHit(note.getHit() + 1);

		int result = noteDao.update(note);

		return result;

	}

	@Override
	public List<NoteView> getHitTopViewList() {

		return noteDao.getHitTopViewList();
	}

	@Override
	public List<NoteView> getNewViewList() {
		List<NoteView> list = noteDao.getNewViewList();

		for (NoteView n : list) {
			String content = n.getContent();

			if (content == null)
				continue;

			Document doc = Jsoup.parse(content);

			// 텍스트만 발췌하기
			String text = doc.text();
			if (text.length() > 250)
				text = text.substring(0, 249);

			n.setContent(text);

			// 첫번째 이미지 골라내기
			Elements imgs = doc.select("img");
			if (imgs.size() > 0) {
				// text += imgs.first().toString();
				n.setThumbImg(imgs.first().attr("src"));
			}

			System.out.println(n);

		}
		return list;
	}

	@Override
	public Note getPrev(int id) {
		// TODO Auto-generated method stub
		return noteDao.getPrev(id);
	}

	@Override
	public Note getNext(int id) {
		// TODO Auto-generated method stub
		return noteDao.getNext(id);
	}

	@Override
	public List<NoteView> getPubViewList() {
		// TODO Auto-generated method stub
		return getPubViewList("", 0, 0, 0, 0, 0, 12);
	}

	@Override
	public List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId,
			int platformId) {
		// TODO Auto-generated method stub
		return getPubViewList(query, myCategoryId, categoryId, languageId, platformId, 0, 12);
	}

	@Override
	public List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId,
			int offset, int size) {

		List<NoteView> list = noteDao.getPubViewList(query, myCategoryId, categoryId, languageId, platformId, offset,
				size);

		for (NoteView n : list) {
			String content = n.getContent();

			if (content == null)
				continue;

			Document doc = Jsoup.parse(content);

			// 텍스트만 발췌하기
			String text = doc.text();
			if (text.length() > 250)
				text = text.substring(0, 249);

			n.setContent(text);

			// 첫번째 이미지 골라내기
			Elements imgs = doc.select("img");
			if (imgs.size() > 0) {
				// text += imgs.first().toString();
				n.setThumbImg(imgs.first().attr("src"));
			}

			System.out.println(n);

		}

		return list;

	}

//=--===-------------------------------------------
	@Override // 사용중
	public List<NoteView> getViewListByWriterId(String writerId) {

		List<NoteView> list = noteDao.getViewListByWriterId(writerId);

		for (NoteView n : list) {
			String content = n.getContent();

			if (content == null)
				continue;

			Document doc = Jsoup.parse(content);

			// 텍스트만 발췌하기
			String text = doc.text();
			if (text.length() > 250)
				text = text.substring(0, 249);

			n.setContent(text);

			// 첫번째 이미지 골라내기
			Elements imgs = doc.select("img");
			if (imgs.size() > 0) {
				// text += imgs.first().toString();
				n.setThumbImg(imgs.first().attr("src"));
			}

		}

		return list;
	}

	@Override
	public int insert(int memberId, String writerId, String title, String content) {

		Note note = new Note(memberId, title, content);

		return noteDao.insert(note);
	}

	@Override
	public int getMemberId(String writerId) {
		// TODO Auto-generated method stub
		return memberDao.getId(writerId);
	}

	@Override
	public int getPub(int id) {
		// TODO Auto-generated method stub
		return noteDao.getPub(id);
	}

	@Override
	public int pub(int id, boolean status) {
		int result = 0;

		Note origin = noteDao.get(id);
		System.out.println(origin);
		origin.setPub(status);
		result = noteDao.update(origin);

		return result;
	}

	@Override
	public int pubAll(int[] ids) {
		int result = 0;

		result = noteDao.pubAll(ids);

		return result;
	}

	@Override
	public int deleteAll(int[] ids) {
		int result = 0;

		System.out.println(ids.length);

		for (int i = 0; i < ids.length; i++)
			result += noteDao.delete(ids[i]);

		return result;
	}

	@Override
	public List<MyCategory> getMyCategoryListByMemberId(int memberId) {
		// TODO Auto-generated method stub
		return myCategoryDao.getListByMemberId(memberId);
	}

	@Override
	public int likeUp(int noteId, int memberId) {
		Like like = new Like();
		like.setNoteId(noteId);
		like.setMemberId(memberId);
		int result = likeDao.insert(like);
		
		return result;
	}

	@Override
	public boolean hasLike(int noteId, int memberId) {
		Like like = likeDao.get(noteId, memberId);
		if(like != null)
			return true;
		
		return false;
	}

}