<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<h3>회원가입</h3>
		<form action="join" method="post" id="joinForm">
			<div>
				<label for="id">아이디</label> 
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" /> 
				<button type="button">ID중복검사</button>
				<br>
				<label for="pwd">비밀번호</label> 
				<input type="text" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" /><br>
				<label for="name">이름</label> 
				<input type="text" name="name" id="name" placeholder="이름을 입력하세요" /><br>
				<label for="dept_nm">부서</label> 
				<input type="text" name="dept_nm" id="dept_nm" placeholder="부서를 입력하세요" />
			</div>
			<button type="submit" class="joinBtn" id="joinBtn">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
	window.onload = function() {
	    let joinForm = document.querySelector("#joinForm");

	    if (joinForm != null) {
	        joinForm.addEventListener("submit", function(e) {
	            e.preventDefault();
				
	            let id = document.querySelector("#id").value;
	            let pwd = document.querySelector("#pwd").value;
	            let name = document.querySelector("#name").value;
	            let dept_nm = document.querySelector("#dept_nm").value;
	            
	            let data = {
	                "id": id,
	                "pwd": pwd,
	                "name": name,
	                "dept_nm": dept_nm
	            };

	            fetch('/test/user/join', {
	                    method: 'POST',
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