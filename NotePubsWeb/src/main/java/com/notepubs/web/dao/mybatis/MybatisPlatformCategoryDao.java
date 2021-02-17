package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.PlatformCategoryDao;
import com.notepubs.web.entity.PlatformCategory;
@Repository
public class MybatisPlatformCategoryDao implements PlatformCategoryDao{

	private PlatformCategoryDao mapper;
	
	@Autowired
	public MybatisPlatformCategoryDao(SqlSession session) {
		mapper = session.getMapper(PlatformCategoryDao.class);
	}
	
	@Override
	public List<PlatformCategory> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}


	
	

}
