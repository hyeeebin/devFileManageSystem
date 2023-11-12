package com.local.test.service;

import java.util.List;

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
}
