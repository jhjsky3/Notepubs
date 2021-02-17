package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.PlatformDao;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformView;
@Repository
public class MyBatisPlatformDao implements PlatformDao{

	private PlatformDao mapper;
	
	@Autowired
	public MyBatisPlatformDao(SqlSession session) {
		mapper = session.getMapper(PlatformDao.class);
	}


	@Override
	public List<Platform> getListByLanguageId(int id) {
		// TODO Auto-generated method stub
		return mapper.getListByLanguageId(id);
	}


	@Override
	public List<Platform> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}


	@Override
	public List<PlatformView> getViewList() {
		// TODO Auto-generated method stub
		return mapper.getViewList();
	}


	@Override
	public int insert(String name, int memberId, int categoryId) {
		// TODO Auto-generated method stub
		return mapper.insert(name, memberId, categoryId);
	}


	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);

	}

	
}
