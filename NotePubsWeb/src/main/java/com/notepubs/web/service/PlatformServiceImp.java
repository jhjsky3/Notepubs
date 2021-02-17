package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.LanguagePlatformDao;
import com.notepubs.web.dao.PlatformCategoryDao;
import com.notepubs.web.dao.PlatformDao;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformCategory;
import com.notepubs.web.entity.PlatformView;

@Service
public class PlatformServiceImp implements PlatformService{

	@Autowired
	PlatformDao platformDao;
	
	@Autowired
	PlatformCategoryDao platformCategortDao;
	
	@Autowired
	LanguagePlatformDao langPlatDao;
	
	
//	@Override
//	public int insert(Platform platform) {
//		
//		return platformDao.insert(platform);
//	}
//
//	@Override
//	public int update(Platform platform) {
//		
//		return platformDao.update(platform);
//	}
//
//	@Override
//	public int delete(int id) {
//		
//		return platformDao.delete(id);
//	}
//
//	@Override
//	public int get(int id) {
//		
//		return platformDao.get(id);
//	}

	@Override
	public List<Platform> getList() {
		
		return platformDao.getList();
	}

//	@Override
//	public List<Platform> getList(int page, String name) {
//		int offset = (page-1)*10;
//		int size = 10;
//		
//		List<Platform> list = platformDao.getList(offset, size, name);
//		return list;
//	}

	@Override
	public List<PlatformView> getViewList() {
		// TODO Auto-generated method stub
		return platformDao.getViewList();
	}

	@Override
	public int insert(String name, int memberId, int categoryId) {
		

		int result = platformDao.insert(name,memberId,categoryId);
		
		return result;
	}

	@Override
	public List<PlatformCategory> getPlatCategoryList() {
		
		return platformCategortDao.getList();
	}

	@Override
	public int langPlatDelete(int id) {
		
		int result = langPlatDao.delete(id);
		
		return result;
	}

	@Override
	public int delete(int id) {
		
		return platformDao.delete(id);

	}

}
