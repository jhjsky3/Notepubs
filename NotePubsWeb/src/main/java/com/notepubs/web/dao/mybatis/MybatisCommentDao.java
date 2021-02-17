package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.CommentDao;
import com.notepubs.web.dao.NoteDao;
import com.notepubs.web.entity.Comment;
import com.notepubs.web.entity.Note;

@Repository
public class MybatisCommentDao implements CommentDao{
	
	private CommentDao mapper;
	@Autowired
	public MybatisCommentDao(SqlSession session) {
		mapper = session.getMapper(CommentDao.class);
	}

	@Override
	public List<Comment> getList() {
		
		return mapper.getList();
	}
	

//	@Override
//	public int insert(Comment comment) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	
}
