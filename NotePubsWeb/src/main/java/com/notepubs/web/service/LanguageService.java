package com.notepubs.web.service;

import java.util.List;

import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageCategory;
import com.notepubs.web.entity.LanguageView;
import com.notepubs.web.entity.Platform;

public interface LanguageService {

	List<Language> getList();

	List<LanguageView> getViewList();

	List<Platform> getPlatformList();

	List<LanguageCategory> getLanguageCategoryList();

	int insert(String name, int memberId, int categoryId);

	int langPlatDelete(int id);

	int delete(int id);

	int update(String name, int id);


	
}
