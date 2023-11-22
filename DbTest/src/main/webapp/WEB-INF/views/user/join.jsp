<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<body>
	<div class="container">
		<h3>회원가입</h3>
		<form action="join" method="post" id="joinForm">
			<div>
				<label for="id">아이디</label> 
				<input type="text" name="id" id="id" class="id" placeholder="아이디를 입력하세요"/>
				<br>
				<div class="id_check"></div>
				
				<label for="pwd">비밀번호</label> 
				<input type="text" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" />
				<br>
				<div class="pwd_check"></div>
				
				<label for="name">이름</label> 
				<input type="text" name="name" id="name" placeholder="이름을 입력하세요"/><br>
				<br>
				<div class="nm_check"></div>
				
				<label for="dept_nm">부서</label> 
				<input type="text" name="dept_nm" id="dept_nm" placeholder="부서를 입력하세요" />
				<br>
				<div class="dept_check"></div>
			</div>
			<button type="submit" class="joinBtn" id="joinBtn">회원가입</button>
			<button type="button" class="delBtn" id="delBtn">취소</button>
		</form>
	</div>
	<script type="text/javascript">
	
	//아이디 유효성 검사
	const idKeyUp = document.querySelector("#id");
	idKeyUp.onkeyup = function(e){
		let id = document.querySelector("#id").value;
		
		let regUserIdPw = /^[a-z0-9](?=.*[a-z])(?=.*\d)[a-z0-9]{3,10}$/;		

	    if (id == "") {
	        $(".id_check").html("아이디를 입력하세요");
	        $(".id_check").css("color", "red");
	        $(".id").focus();
	        return false;
	    } else if (!regUserIdPw.test(id)) {
	        $(".id_check").html("4~10자의 영 대소문자+숫자 조합으로 입력하세요.");
	        $(".id_check").css("color", "red");
	        $(".id").focus();
	        return false;
	    } else {
	        $(".id_check").html("");
	        return true;
	    }
	};
	
	//비밀번호 유효성 검사
	//이름 유효성 검사
	//부서 유효성 검사
	
	//버튼 클릭 시 유효성 검사
	//아이디 중복 검사 
	
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
	
	//취소버튼 클릭시 진행되는 이벤트 
	const delBtn = document.querySelector(".delBtn");
	delBtn.onclick = function(){
		if (confirm("작업을 중단하고 로그인 페이지로 이동하시겠습니까?")) {
	        location = "/test/user/loginForm";
	        return true;
	    } else {
	        return false;
	    }
	}
	
	</script>
</body>
</html>