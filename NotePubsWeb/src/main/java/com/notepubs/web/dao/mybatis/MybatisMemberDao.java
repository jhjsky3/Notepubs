package com.notepubs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notepubs.web.dao.MemberDao;
import com.notepubs.web.entity.Member;
import com.notepubs.web.entity.MemberView;

@Repository
public class MybatisMemberDao implements MemberDao{
	
	private MemberDao mapper;
	
	@Autowired
	public MybatisMemberDao(SqlSession session) {
		mapper = session.getMapper(MemberDao.class);
	}

	@Override
	public List<Member> getList() {
		
		return mapper.getList();
	}
	
	@Override
	public List<Member> getList(String field) {
		
		return mapper.getList(field);
	}

	@Override
	public int insert(Member member) {
		
		return mapper.insert(member);
	}

	@Override
	public int update(Member member) {
		
		return mapper.update(member);
	}

	@Override
	public int delete(int id) {
		
		return mapper.delete(id);
	}

	@Override
	public Member get(int id) {
		
		return mapper.get(id);
	}

	@Override

	public int getId(String writerId) {
		// TODO Auto-generated method stub
		return mapper.getId(writerId);
	}
	
	public List<MemberView> getViewList(int page, String column1, String column2, String column3, String loginName) {
		// TODO Auto-generated method stub
		return mapper.getViewList(page, column1, column2, column3,loginName);
	}


	@Override
	public int getCnt(int page, String column1, String column2, String column3, String loginName) {
		// TODO Auto-generated method stub
		return mapper.getCnt(page, column1, column2, column3, loginName);
	}

	@Override
	public Member getByNicName(String nicName) {
		// TODO Auto-generated method stub
		return mapper.getByNicName(nicName);
	}

	
	

	
}
