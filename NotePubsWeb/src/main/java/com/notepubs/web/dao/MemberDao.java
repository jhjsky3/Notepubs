package com.notepubs.web.dao;

import java.util.List;

import com.notepubs.web.entity.Member;
import com.notepubs.web.entity.MemberView;

public interface MemberDao {
	int insert(Member member);
	int update(Member member);
	int delete(int id);
	
	Member get(int id);
	Member getByNicName(String nicName);
	
	List<Member> getList();
	List<Member> getList(String field);

	int getId(String writerId);

	List<MemberView> getViewList(int page, String column1, String column2, String column3, String loginName);
	int getCnt(int page, String column1, String column2, String column3, String loginName);
}
