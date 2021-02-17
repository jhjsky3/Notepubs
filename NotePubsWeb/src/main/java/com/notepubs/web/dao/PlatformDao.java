package com.notepubs.web.dao;

import java.util.List;

import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformView;

public interface PlatformDao {
	
//	int insert(Platform platform);
//	int update(Platform platform);
//	int delete(int id);
//	
//	int get(int id);
	
	List<Platform> getList();

	List<PlatformView> getViewList();


	List<Platform> getListByLanguageId(int id);
	int insert(String name, int memberId, int categoryId);
	int delete(int id);
	
	
}
