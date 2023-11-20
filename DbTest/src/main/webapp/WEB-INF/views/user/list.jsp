<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자목록</title>
</head>
<body>
	<h3>사용자 목록</h3>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>부서명</th>
			<th>비고</th>
			<th>가입일자</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.id}</td>
				<td>${user.pwd}</td>
				<td>${user.name}</td>
				<td>${user.dept_nm}</td>
				<td>${user.remark}</td>
				<td>${user.regDate}</td>
				<td>${user.use_yn}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>