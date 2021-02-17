package com.notepubs.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.notepubs.web.entity.Book;
import com.notepubs.web.entity.BookView;

public interface BookService {
	
	List<BookView> getList(int page, String field, String query);
	List<BookView> getViewList(int page, String field, String query);
	Book get(int id);

	
}
