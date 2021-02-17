package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.LanguageCategoryDao;
import com.notepubs.web.dao.LanguageDao;
import com.notepubs.web.dao.LanguagePlatformDao;
import com.notepubs.web.dao.PlatformDao;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageCategory;
import com.notepubs.web.entity.LanguageView;
import com.notepubs.web.entity.Platform;

@Service
public class LanguageServiceImp implements LanguageService{

	@Autowired
	private LanguageDao languageDao;
	
	@Autowired
	private PlatformDao platformDao;
	
	@Autowired
	private LanguageCategoryDao languageCategoryDao;
	
	@Autowired
	private LanguagePlatformDao languagePlatformDao;
	
	@Override
	public List<Language> getList() {
		// TODO Auto-generated method stub
		return languageDao.getList();
	}

	@Override
	public List<LanguageView> getViewList() {
		List<LanguageView> list = languageDao.getViewList();
		
		for(LanguageView lang : list) {
			lang.setPlatforms(platformDao.getListByLanguageId(lang.getId()));
			System.out.println(lang.getPlatforms());
		}
			 
		return list;
	}

	@Override
	public List<Platform> getPlatformList() {
		// TODO Auto-generated method stub
		return platformDao.getList();
	}

	@Override
	public List<LanguageCategory> getLanguageCategoryList() {
		
		return languageCategoryDao.getList();
	}

	@Override
	public int insert(String name, int memberId, int categoryId) {
		
		int result = languageDao.insert(name,memberId,categoryId);
		
		return result;
	}

	@Override
	public int langPlatDelete(int id) {
		
		int result = languagePlatformDao.delete(id);
		
		return result;
	}

	@Override
	public int delete(int id) {
		
		int result = languageDao.delete(id);
		
		return result;
	}

	@Override
	public int update(String name, int id) {
		// TODO Auto-generated method stub
		return 0;
	}





}
