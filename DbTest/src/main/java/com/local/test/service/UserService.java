package com.local.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.local.test.dao.UserRepository;
import com.local.test.model.UserVO;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	
	public List<UserVO> getUserList(){
		return userRepository.getUserList();
	}
	
	public int join(Map<String, String> joinMap) {
		return userRepository.join(joinMap);
	}
	
	public UserVO login(Map<String, String> loginMap) {
		return userRepository.login(loginMap);
	}
}
