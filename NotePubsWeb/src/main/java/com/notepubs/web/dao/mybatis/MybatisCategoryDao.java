package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.CategoryDao;
import com.notepubs.web.entity.Category;
@Repository
public class MybatisCategoryDao implements CategoryDao{
	
	private CategoryDao mapper;
	@Autowired
	public MybatisCategoryDao(SqlSession session) {
		mapper = session.getMapper(CategoryDao.class);
	}
	
	
	@Override
	public List<Category> getList() {
	
		return mapper.getList();
	}
	
}
