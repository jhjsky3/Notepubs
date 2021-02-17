package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.BookDao;
import com.notepubs.web.entity.Book;
import com.notepubs.web.entity.BookView;
@Service
public class BookServiceImp implements BookService{

	@Autowired
	private BookDao bookDao;
	

	@Override
	public List<BookView> getList(int page, String field, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookView> getViewList(int page, String field, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
