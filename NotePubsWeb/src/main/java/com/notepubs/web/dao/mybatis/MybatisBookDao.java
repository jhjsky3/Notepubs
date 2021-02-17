package com.notepubs.web.dao.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.BookDao;
import com.notepubs.web.entity.Book;

@Repository
public class MybatisBookDao implements BookDao{

	//private BookDao mapper;
	@Autowired
	public MybatisBookDao(SqlSession session) {
		//mapper = session.getMapper(BookDao.class);
	}
	
	@Override
	public List<Book> getList() {
		// TODO Auto-generated method stub
		return new ArrayList<>();//mapper.getList();
	}

	@Override
	public int insert(Book book) {
		// TODO Auto-generated method stub
		
		return 0;//mapper.insert(book);
	}

}
