package com.local.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> join(@RequestBody HashMap<String,String> joinMap)throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		int result = userService.join(joinMap);
		if(result == 1) {
			map.put("status", "true");
			map.put("message", "회원가입 성공!");
			map.put("url", "/test/user/loginForm");
		}else {
			map.put("message", "회원가입 실패!");
		}
		return map;
	}
}
