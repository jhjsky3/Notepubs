package com.notepubs.web.dao.mybatis;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.MyCategoryDao;
import com.notepubs.web.entity.MyCategory;
@Repository
public class MybatisMyCategoryDao implements MyCategoryDao{
	
	private MyCategoryDao mapper;
	@Autowired
	public MybatisMyCategoryDao(SqlSession session) {
		mapper = session.getMapper(MyCategoryDao.class);
	}
	
	@Override
	public List<MyCategory> getListByMemberId(int memberId){
		
		return mapper.getListByMemberId(memberId);
	}

	@Override
	public int insert(String myCategoryName, int memberId) {
		// TODO Auto-generated method stub
		return mapper.insert(myCategoryName, memberId);
	}

	@Override
	public int getId(String myCategoryName, int memberId) {
		// TODO Auto-generated method stub
		return mapper.getId(myCategoryName, memberId);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

	@Override
	public List<MyCategory> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}


}
