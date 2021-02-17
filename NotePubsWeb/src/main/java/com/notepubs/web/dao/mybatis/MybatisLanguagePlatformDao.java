package com.notepubs.web.dao.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.LanguagePlatformDao;
@Repository
public class MybatisLanguagePlatformDao implements LanguagePlatformDao {

	private LanguagePlatformDao mapper;
	
	@Autowired
	public MybatisLanguagePlatformDao(SqlSession session) {
		mapper = session.getMapper(LanguagePlatformDao.class);
	}
	
	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

}
