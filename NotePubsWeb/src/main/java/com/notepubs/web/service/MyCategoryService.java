package com.notepubs.web.service;

import java.util.List;

import com.notepubs.web.entity.MyCategory;

public interface MyCategoryService {

	int insert(String myCategoryName, int memberId);

	int getId(String myCategoryName, int memberId);

	List<MyCategory> getList();

	int delete(int id);
	
	

}
