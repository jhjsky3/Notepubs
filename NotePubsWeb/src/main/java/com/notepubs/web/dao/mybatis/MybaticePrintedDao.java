package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.PrintedDao;
import com.notepubs.web.entity.Printed;

@Repository
public class MybaticePrintedDao implements PrintedDao {

	private PrintedDao mapper;
	
	@Autowired
	public MybaticePrintedDao(SqlSession session) {
		mapper = session.getMapper(PrintedDao.class);
	}
	
	@Override
	public List<Printed> getList() {
		
		return mapper.getList();
	}

}
