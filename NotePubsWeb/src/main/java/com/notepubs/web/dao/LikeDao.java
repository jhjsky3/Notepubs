package com.notepubs.web.dao;

import com.notepubs.web.entity.Like;

public interface LikeDao {
	int insert(Like like);
	Like get(int noteId, int memberId);
}
