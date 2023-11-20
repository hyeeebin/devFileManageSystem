<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<h3>로그인</h3>
		<form action="login" method="post">
			<div>
				<label for="id">아이디</label> 
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" /><br>
				<label for="pwd">비밀번호</label> 
				<input type="text" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" />
			</div>
			<button type="submit">로그인</button><br>
			<button type="button" onclick="location.href='joinForm'">회원가입</button>
		</form>
	</div>
</body>
</html>