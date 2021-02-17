package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.MyCategoryDao;
import com.notepubs.web.entity.MyCategory;

@Service
public class MyCategoryServiceImp implements MyCategoryService{

	@Autowired
	private MyCategoryDao mycategoryDao;
	
	@Override
	public int insert(String myCategoryName, int memberId) {
		
		int result = mycategoryDao.insert(myCategoryName,memberId);
		
		return result;
	}

	@Override
	public int getId(String myCategoryName, int memberId) {
	
		//return result;
		return mycategoryDao.getId(myCategoryName, memberId);
	}

	@Override
	public int delete(int id) {
		
		int result = mycategoryDao.delete(id);
		
		return result;
	}

	@Override
	public List<MyCategory> getList() {
		// TODO Auto-generated method stub
		return null;
	}


}
