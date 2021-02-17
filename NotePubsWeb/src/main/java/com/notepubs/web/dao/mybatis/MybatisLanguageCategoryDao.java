package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.LanguageCategoryDao;
import com.notepubs.web.dao.LanguageDao;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageCategory;
import com.notepubs.web.entity.LanguageView;

@Repository
public class MybatisLanguageCategoryDao implements LanguageCategoryDao {

	private LanguageCategoryDao mapper; 	
	
	@Autowired
	public MybatisLanguageCategoryDao(SqlSession session) {
		mapper = session.getMapper(LanguageCategoryDao.class);
	}

	@Override
	public List<LanguageCategory> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	
	


}
