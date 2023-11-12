package com.local.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.local.test.model.UserVO;
import com.local.test.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/list")
	public String getAllUsers(Model model) {
		List<UserVO> userList = userService.getUserList();
		model.addAttribute("userList",userList);
		
		return "user/list";
	}
}
