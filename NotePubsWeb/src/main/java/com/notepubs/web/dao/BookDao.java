package com.notepubs.web.dao;

import java.util.List;

import com.notepubs.web.entity.Book;

public interface BookDao {

	List<Book> getList();
	int insert(Book book);
}
