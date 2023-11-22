package com.local.test.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	private UserVO userVO;
	
	//사용자 목록
	@RequestMapping(value="/list")
	public String getAllUsers(Model model) {
		List<UserVO> userList = userService.getUserList();
		model.addAttribute("userList",userList);
		return "user/list";
	}
	
	//로그인 화면
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	
	//로그인
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(@RequestBody HashMap<String, String> loginMap, 
									HttpSession session)throws Exception{
		Map<String, String> map  = new HashMap<String, String>();
		
		userVO = userService.login(loginMap);
		
		if(userVO != null && userVO.getId() != null) {
			session.setAttribute("userId", userVO.getId());
			session.setAttribute("userNm", userVO.getName());
			session.setAttribute("isLoginOn", true);
			
			map.put("status", "true");
			map.put("message", "로그인 성공!"+userVO.getName()+"님 환영합니다.");
			map.put("url", "/test/file/fileList");
		}else {
			map.put("status", "false");
			map.put("message", "로그인 실패! 다시 시도해주세요.");
			map.put("url", "/test/user/loginForm");
		}
		
		return map;
	}
	
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		
		System.out.println("로그아웃");
		
		return "user/loginForm";
	}
	
	
	//회원가입 화면
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		return "user/join";
	}
	
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> join(@RequestBody HashMap<String,String> joinMap)throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		int result = userService.join(joinMap);
		if(result == 1) {
			map.put("status", "true");
			map.put("message", "환영합니다! 로그인페이지로 이동합니다. ");
			map.put("url", "/test/user/loginForm");
		}else {
			map.put("message", "회원가입 실패!");
		}
		return map;
	}
	
	//마이페이지 화면
	//마이페이지 (내 정보, 내가 업로드한 문서 목록 출력)
}
