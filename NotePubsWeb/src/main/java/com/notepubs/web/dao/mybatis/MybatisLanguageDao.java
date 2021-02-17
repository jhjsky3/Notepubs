package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.LanguageDao;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageView;

@Repository
public class MybatisLanguageDao implements LanguageDao {

	private LanguageDao mapper; 	
	
	@Autowired
	public MybatisLanguageDao(SqlSession session) {
		mapper = session.getMapper(LanguageDao.class);
	}
	
	@Override
	public List<Language> getList() {
		
		return mapper.getList();
	}

	@Override
	public List<LanguageView> getViewList() {
		// TODO Auto-generated method stub
		return mapper.getViewList();
	}

	@Override
	public List<Language> getList(String name) {
		
		return mapper.getList(name);
	}

	@Override
	public int insert(String name, int memberId, int categoryId) {
		
		return mapper.insert(name, memberId, categoryId);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}


}
