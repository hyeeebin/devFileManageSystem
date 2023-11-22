<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규파일업로드</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	//취소버튼 클릭시 진행되는 이벤트 
	const delBtn = document.querySelector(".delBtn");
	delBtn.onclick = function(){
		if (confirm("작업을 중단하고 파일목록으로 이동하시겠습니까?")) {
	        location = "/test/file/fileList";
	        return true;
	    } else {
	        return false;
	    }
	}
</script>
<body>
<div class="container">
		<h3>신규파일업로드</h3>
		<form action="upload" method="post" id="upload" enctype="multipart/form-data">
			<div>
				<label for="doc_sort">문서구분</label> 
				<input type="text" name="doc_sort" id="doc_sort" class="doc_sort" />
				<br>
				<div class="id_check"></div>
				
				<label for="doc_step">단계</label> 
				<input type="text" name="doc_step" id="doc_step" />
				<br>
				<div class="pwd_check"></div>
				
				<label for="doc_activity">활동</label> 
				<input type="text" name="doc_activity" id="doc_activity"/><br>
				<br>
				<div class="nm_check"></div>
				
				<label for="doc_task">태스크</label> 
				<input type="text" name="doc_task" id="doc_task"/>
				<br>
				<div class="dept_check"></div>
				
				<label for="doc_output">산출물</label> 
				<input type="text" name="doc_output" id="doc_output" />
				<br>
				<div class="dept_check"></div>
				
				
				<input type="file" name="file" id="file" />
				<br>
				<div class="dept_check"></div>
				
				<label for="file_comment">파일내용초록</label> 
				<input type="text" name="file_comment" id="file_comment" />
				<br>
				<div class="dept_check"></div>
				
				<label for="remark">비고</label> 
				<input type="text" name="remark" id="remark" />
				
			</div>
			<button type="submit" class="uploadBtn" id="uploadBtn">등록</button>
			<button type="button" class="delBtn" id="delBtn">취소</button>
		</form>
	</div>

</body>
</html>
