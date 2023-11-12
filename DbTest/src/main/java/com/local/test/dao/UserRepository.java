package com.local.test.dao;

import java.util.List;

import com.local.test.model.UserVO;

public interface UserRepository {
	public List<UserVO> getUserList();
}
