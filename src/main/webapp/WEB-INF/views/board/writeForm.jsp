<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" 
			value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function readURL(input){
	let file = input.files[0]//파일에 대한 정보
	console.log(file)
	if(file != ""){
		let reader = new FileReader();
		reader.readAsDataURL(file);//파일의 정보를 토대로 파일 읽고
		reader.onload = function(e){ //파일 로드한 값을 표현
			//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다
			$("#preview").attr('src',e.target.result);
		}
	}
}
</script>


</head>
<body>
	<c:import url="../default/header.jsp"/>
<div class="wrap">
<div align="center">
	<h3>글 쓰 기</h3>
	<form action="${contextPath }/board/writeSave"
				method="post" enctype="multipart/form-data">
		<b>작성자</b><br>
		<input type="text" name="id" value="${loginUser }"
											readonly><hr>
		<b>제 목</b><br>
		<input type="text" size="50" name="title"><hr>
		<b>내용</b><br>
		<textarea rows="10" cols="50" name="content"></textarea>
		<hr>
		<b>이미지파일 첨부</b><br>
		<input type="file" name="image_file_name"
							onchange="readURL(this)">
		<img id="preview" src="#" width="100" height="100"
							alt="선택 이미지 없음">
		<hr>
		<input type="submit" value="글쓰기">
		<input type="button" value="목록이동"
							onclick=
	"location.href='${contextPath}/board/boardAllList'">
						
	</form>
</div>
</div>


</body>
</html>











