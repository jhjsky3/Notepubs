package com.notepubs.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.LikeDao;
import com.notepubs.web.dao.NoteDao;
import com.notepubs.web.entity.Like;

@Repository
public class MybaticeLikeDao implements LikeDao {

	private LikeDao mapper;
	
	@Autowired
	public MybaticeLikeDao(SqlSession session) {
		mapper = session.getMapper(LikeDao.class);
	}
	
	@Override
	public int insert(Like like) {
		// TODO Auto-generated method stub
		return mapper.insert(like);
	}

	@Override
	public Like get(int noteId, int memberId) {
		// TODO Auto-generated method stub
		return mapper.get(noteId, memberId);
	}

}
