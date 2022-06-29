<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
			console.log(data.userSelectedType)
			console.log(data.roadAddress)
			console.log(data.jibunAddress)
			console.log(data.zonecode)
			var addr=""
			if(data.userSelectedType == 'R'){
				addr = data.roadAddress
			}else{
				addr = data.jibunAddress
			}
			document.getElementById("addr1").value=data.zonecode
        	$("#addr2").val( addr )
        	$("#addr3").focus()
        }
    }).open();
}
function register(){
	var addr1 = $("#addr1").val()
	var addr2 = $("#addr2").val()
	var addr3 = $("#addr3").val()
	$("#addr1").val( addr1+"/"+addr2+"/"+addr3 )
	fo.submit()
}
function chkId(){
	let inputId = $("#id").val()
	$.ajax({    
		url : "idChk/"+inputId, type:"get",
		dataType:"json",
		success: function(data){
			if(data == 0){
				$("label").html("<b style='color:blue;'>"+inputId+"는 사용 가능 아이디 입니다</b>")
			}else if(data == -1){// 사용 불가능 아이디
				$("label").html("<b style='color:hotpink;'>길이가 짧습니다</b>")
			}else{
				$("label").html("<b style='color:red;'>중복된 아이디 입니다</b>")
			}
		}
	})
	
}
</script>


</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	<form id="fo" action="register" method="post">
		<input type="text" oninput="chkId()" id="id" name="id">
		<label id="label">아이디 중복 체크</label>
		<br> 
		<input type="text" name="pw"><br> 
		<input type="text" readonly id="addr1" name="addr"><br> 
<input type="button" onclick="daumPost()" 
							value="우편번호찾기"><br>
		<input type="text" readonly id="addr2">
		<input type="text" id="addr3">
		
		<input type="button" onclick="register()" value="register"><br> 
	</form>
</div>
</body>



</html>










