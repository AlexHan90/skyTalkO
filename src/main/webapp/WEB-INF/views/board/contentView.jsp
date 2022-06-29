<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modal_wrap{
	display: none; position: fixed; z-index: 9;
	margin: 0 auto; top:0; left: 0; right: 0;
	width: 100%; height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}
#first{
	display: none; position: fixed; z-index: 10;
	margin: 0 auto; top: 30px; left: 0; right: 0;
	width: 350px; height: 450px;
	background-color: rgba(212, 244, 250, 0.9);
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function slideClick(){
	$("#first").slideDown("slow");
	$("#modal_wrap").show();
}
function slide_hidde(){
	$("#first").hide()
	$("#modal_wrap").hide()
}
function rep(){
	let form={};
	let arr = $("#frm").serializeArray();
	console.log(arr)
	for(i=0; i<arr.length;i++){
		form[arr[i].name] = arr[i].value
	}
	console.log(form)
	$.ajax({
		url:"addReply", type:"post",
		data: JSON.stringify(form),
		contentType:"application/json; charset=utf-8",
		success: function(){
			alert("답글이 달렸습니다");
			slide_hidde();
			replyData();
		}
	})	
}

function replyData(){
	$.ajax({
		url:"replyData/"+${dto.writeNo}, type:"get",
		dataType:"json", 
		success: function(rep){
			console.log( rep )
			let html = ""
			rep.forEach(function(data){
				let d = new Date(data.write_date)
				let w_d = d.getFullYear()+"년"
				w_d += d.getMonth()+1+"월"
				w_d += d.getDate()+"일"
				w_d += d.getHours()+"시"
				w_d += d.getMinutes()+"분"
				w_d += d.getSeconds()+"초"
html += "<div align='left'><b>아이디 : </b>"+data.id+"님 / "
html += "<b>작성일</b> : "+w_d+"<br>"
html += "<b>제목</b> : "+data.title+"<br>"
html += "<b>내용</b> : "+data.content+"<hr></div>"
	 	})
			$("#reply").html(html)
		}
	})
} 
 



</script>

</head>

<body onload="replyData()">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" 
			value="${pageContext.request.contextPath }"/>
<c:import url="../default/header.jsp"/>

<table border="1" style="margin: 0 auto;">
	<tr>
		<th width="100">글번호</th> <td width="200">${dto.writeNo }</td>
		<th width="100">작성자</th> <td width="200">${dto.id }</td>
	</tr>
	<tr>
		<th>제목</th> <td>${dto.title }</td>
		<th>등록일자</th> <td>${dto.saveDate }</td>
	</tr>
	
	<tr>
		<th>내용</th> <td>${dto.content }</td>
		<td colspan="2">
			<c:if test="${dto.imageFileName == 'nan' }">
				<b>이미지가 없습니다</b>
			</c:if>
			<c:if test="${dto.imageFileName != 'nan' }">
	<a href="download?imageFileName=${dto.imageFileName}">
		<img alt="이미지를 불러올 수 없습니다" width="200px" height="100px" 
		src="download?imageFileName=${dto.imageFileName}">
	</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<c:if test="${loginUser == dto.id }">
				<input type="button" value="수정하기" onclick=
			"location.href='modify_form?writeNo=${dto.writeNo}'">
				<input type="button" value="삭제하기" onclick="location.href='delete?writeNo=${dto.writeNo}&imageFileName=${dto.imageFileName }'">
			</c:if>
			<input type="button" value="답글달기" onclick="slideClick()">
			<input type="button" value="리스트이동" onclick="location.href='../board/boardAllList'">
		</td>
	</tr>
	
	<tr>
		<td colspan="4">
			<div id="reply"></div>
		</td>
	</tr>
</table>





<div id="modal_wrap">
<div id="first">
<div style="width:250px; margin:0 auto; padding-top:20px">
	<form id="frm">
		<input type="hidden" name="write_no" 
								value="${dto.writeNo }">
		<b>답글 작성 페이지</b><hr>
		<b>작성자 : ${loginUser }</b><hr>
		<b>제목</b><br>
		<input type="text" id="title" size="30" name="title">
		<hr>
		<b>내용</b><br>
		<textarea rows="5" cols="30" 
					id="content" name="content"></textarea>
		<hr>
		<button type="button" onclick="rep()">답글</button>
		<button type="button" onclick="slide_hidde()">취소</button>
	</form>
</div>
</div>
</div>

</body>
</html>
































