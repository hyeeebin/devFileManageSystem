<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String)session.getAttribute("userId");
	String name = (String)session.getAttribute("userNm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<h3>마이페이지</h3>
<h3><%=name %>님 환영합니다.</h3>
<h3>내 정보</h3>
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
		<c:forEach var="user" items="${userInfo}">
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
	
<h3>내 문서</h3>
	<table>
		<tr>
			<th>순번</th>
			<th>문서구분</th>
			<th>단계</th>
			<th>활동</th>
			<th>태스크</th>
			<th>산출물</th>
			<th>작성자</th>
			<th>파일명</th>
			<th>파일위치</th>
			<th>파일초록</th>
			<th>다운로드링크</th>
			<th>비고</th>
			<th>다운로드</th>
		</tr>
		<c:forEach var="file" items="${fileInfo}">
			<tr>
				<td>${file.doc_seq}</td>
				<td>${file.doc_sort}</td>
				<td>${file.doc_step}</td>
				<td>${file.doc_activity}</td>
				<td>${file.doc_task}</td>
				<td>${file.doc_output}</td>
				<td>${file.id}</td>
				<td>${file.file_nm}</td>
				<td>${file.file_pos}</td>
				<td>${file.file_comment}</td>
				<td>${file.file_dn_link}</td>
				<td>${file.remark}</td>
				<td><a href='<c:url value="/file/download?doc_seq=${file.doc_seq}"/>'>다운로드</a></td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" onclick="location.href='/test/file/fileList'">파일목록으로 돌아가기</button>
</body>
</html>