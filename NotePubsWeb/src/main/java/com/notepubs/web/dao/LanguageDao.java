package com.notepubs.web.dao;

import java.util.List;

import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageView;
import com.notepubs.web.entity.Platform;


public interface LanguageDao {
	
	List<Language> getList();
	List<Language> getList(String name);

	List<LanguageView> getViewList();
	int insert(String name, int memberId, int categoryId);
	int delete(int id);
}
