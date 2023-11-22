<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String)session.getAttribute("userNm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 목록</title>
</head>
<body>
<h3>파일 목록</h3>
<h3><%=name %>님 환영합니다.</h3>
<button type="button" class="logout" id="logout">로그아웃</button>
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
		<c:forEach var="file" items="${fileList}">
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
	<div>
		<button type="button" onclick="location.href='uploadFileForm'" >신규파일업로드</button>
	</div>
	<script type="text/javascript">
	//취소버튼 클릭시 진행되는 이벤트 
	const logout = document.querySelector("#logout");
	logout.onclick = function(){
		 if (confirm("로그아웃하시겠습니까? ")) {
	        location = "/test/user/logout";
	        alert("로그아웃 되었습니다.");
	        return true;
	    } else {
	        return false;
	    }
	}
</script>
</body>
</html>