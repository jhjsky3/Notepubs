package com.notepubs.web.dao;

import java.util.List;
import com.notepubs.web.entity.MyCategory;


public interface MyCategoryDao {
	
	
	List<MyCategory> getListByMemberId(int memberId);
	List<MyCategory> getList();

	int insert(String myCategoryName, int memberId);
	int getId(String myCategoryName, int memberId);

	int delete(int id);


	
}
