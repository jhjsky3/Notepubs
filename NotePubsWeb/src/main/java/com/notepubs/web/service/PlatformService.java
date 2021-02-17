package com.notepubs.web.service;

import java.util.List;

import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformCategory;
import com.notepubs.web.entity.PlatformView;

public interface PlatformService {

//	int insert(Platform platform);
//	int update(Platform platform);
//	int delete(int id);
//	
//	int get(int id);
	List<Platform> getList();
	//List<Platform> getList(int page, String name);
	List<PlatformView> getViewList();
	int insert(String name, int memberId, int categoryId);
	List<PlatformCategory> getPlatCategoryList();
	int langPlatDelete(int id);
	int delete(int id);
	
}
