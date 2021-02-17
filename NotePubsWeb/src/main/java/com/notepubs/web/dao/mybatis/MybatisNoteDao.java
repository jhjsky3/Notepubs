package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.NoteDao;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;

@Repository
public class MybatisNoteDao implements NoteDao{
	
	private NoteDao mapper;
	
	@Autowired
	public MybatisNoteDao(SqlSession session) {
		mapper = session.getMapper(NoteDao.class);
	}


	@Override
	public int update(Note note) {
		
		return mapper.update(note);
	}

	@Override
	public int delete(int id) {
		
		return mapper.delete(id);
	}

	@Override
	public NoteView getView(int id) {

		
		return mapper.getView(id);
	}


	@Override
	public List<NoteView> getHitTopViewList() {
		// TODO Auto-generated method stub
		return mapper.getHitTopViewList();
	}

	@Override
	public List<NoteView> getNewViewList() {
		// TODO Auto-generated method stub
		return mapper.getNewViewList();
	}

	@Override
	public Note get(int id) {
		
		return mapper.get(id);
	}

	@Override
	public Note getPrev(int id) {
		// TODO Auto-generated method stub
		return mapper.getPrev(id);
	}

	@Override
	public Note getNext(int id) {
		// TODO Auto-generated method stub
		return mapper.getNext(id);
	}

	@Override
	public List<NoteView> getPubViewList() {
		// TODO Auto-generated method stub
		return mapper.getPubViewList();
	}

	@Override
	public List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId,
			int platformId) {
		// TODO Auto-generated method stub
		return mapper.getPubViewList(query, myCategoryId,categoryId,languageId,platformId);
	}

	@Override
	public List<NoteView> getPubViewList(String query, int myCategoryId, int categoryId, int languageId, int platformId,
			int offset, int size) {
		// TODO Auto-generated method stub
		return mapper.getPubViewList( query, myCategoryId, categoryId, languageId, platformId,
				offset, size);
	}


	@Override
	public List<Note> getList() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title, int myCategoryId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId, int languageId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(String title, int myCategoryId, int categoryId, int languageId, int platformId,
			int offSet, int size, String orderColumn, boolean pub) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Note> getList(int offSet, int size, String orderColumn, boolean pub) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<NoteView> getViewList() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insert(Note note) {
		// TODO Auto-generated method stub
		return mapper.insert(note);
	}


	@Override
	public List<NoteView> getViewListByWriterId(String writerId) {
		// TODO Auto-generated method stub
		return mapper.getViewListByWriterId(writerId);
	}


	@Override
	public int getPub(int id) {
		// TODO Auto-generated method stub
		return mapper.getPub(id);
	}

	@Override
	public int pubAll(int[] ids) {
		// TODO Auto-generated method stub
		return mapper.pubAll(ids);
	}



	
	
}
