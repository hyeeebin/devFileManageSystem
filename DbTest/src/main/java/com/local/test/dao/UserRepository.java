package com.local.test.dao;

import java.util.List;
import java.util.Map;

import com.local.test.model.UserVO;

public interface UserRepository {
	public List<UserVO> getUserList();
	
	public int join(Map<String,String> joinMap);
}
