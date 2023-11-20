<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <h3>파일 업로드 폼</h3>
      <form action="upload" method="post" enctype="multipart/form-data">
         <div>
            <label for="file_title">제목</label>
            <input type="text" name="file_title" id="file_title" placeholder="제목을 입력하세요."/>
         </div>
         <div>
            <label for="fileData">첨부파일</label>
            <input type="file" name="fileData" id="fileData"/>
         </div>
         <button type="submit">업로드</button>
      </form>
   </div>
</body>
</html>