<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<h3>로그인</h3>
		<form action="login" id="loginForm" method="post">
			<div>
				<label for="id">아이디</label> 
				<input type="text" name="id" id="id" class="id"  placeholder="아이디를 입력하세요" /><br>
				<label for="pwd">비밀번호</label> 
				<input type="text" name="pwd" id="pwd" class="pwd" placeholder="비밀번호를 입력하세요" />
			</div>
			<button type="submit" class="loginBtn" id="loginBtn">로그인</button><br>
			<button type="button" onclick="location.href='joinForm'">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
		window.onload = function(){
/* 			let id = document.querySelector("#id").value;
			let pwd = document.querySelector("#pwd").value;
			
			let regUserIdPw = /^[a-z0-9](?=.*[a-z])(?=.*\d)[a-z0-9]{3,10}$/;
			
			 //아이디 비밀번호 공백 확인
		    if (id == "") {
		        alert("아이디를 입력하세요");
		        $(".id").focus();
		        return;
		    } else if (pwd == "") {
		        alert("비밀번호를 입력하세요");
		        $(".pwd").focus();
		        return;
		    } else if (!regUserIdPw.test(id)) {
		        alert("아이디가 형식에 맞지않습니다.\n 4~10자의 영 대소문자+숫자 조합으로 입력하세요.");
		        $(".id").focus();
		        return;
		    } else if (!regUserIdPw.test(pwd)) {
		        alert("비밀번호가 형식에 맞지않습니다.\n 4~10자의 영 대소문자+숫자 조합으로 입력하세요.");
		        $(".pwd").focus();
		        return;
		    } */
			 
			let loginForm = document.querySelector("#loginForm");
			
			if(loginForm != null){
				loginForm.addEventListener("submit",function(e){
					e.preventDefault();
					let id = document.querySelector("#id").value;
					let pwd = document.querySelector("#pwd").value;
					
					let data = {
						"id": id,
			             "pwd": pwd
					};
					
					fetch('/test/user/login', {
						method:'POST',
						 headers: {
		                        'Content-Type': 'application/json;charset=utf-8'
		                    },
		                    body: JSON.stringify(data)
		                })
		                .then(response => response.json())
		                .then(jsonResult => {
		                    alert(jsonResult.message);
		                    location.href = jsonResult.url;
		                })
		                .catch(error => {
		                    console.error('에러:', error);
		                });
		            return false;
		        });
			}
			
		}
	</script>
</body>
</html>