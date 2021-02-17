package com.notepubs.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notepubs.web.dao.MemberDao;
import com.notepubs.web.entity.Member;
import com.notepubs.web.entity.MemberView;
@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<Member> getList(String field) {
		
		return memberDao.getList(field);
	}
	
	@Override
	public List<Member> getList() {
		// TODO Auto-generated method stub
		return memberDao.getList();
	}

	@Override
	public int insert(Member member) {
		// TODO Auto-generated method stub
		return memberDao.insert(member);
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return memberDao.update(member);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return memberDao.delete(id);
	}

	@Override
	public Member get(int id) {
		// TODO Auto-generated method stub
		return memberDao.get(id);
	}

	@Override
	public List<MemberView> getViewList(int page, String column1, String column2, String column3, String loginName) {
		// TODO Auto-generated method stub
		return memberDao.getViewList(page, column1, column2, column3,loginName);
	}

	@Override
	public int getCnt(int page, String column1, String column2, String column3, String name) {
		// TODO Auto-generated method stub
		return memberDao.getCnt(page, column1,column2, column3, name);
	}

	@Override
	public Member getByNicName(String nicName) {
		// TODO Auto-generated method stub
		return memberDao.getByNicName(nicName);
	}


	

}
