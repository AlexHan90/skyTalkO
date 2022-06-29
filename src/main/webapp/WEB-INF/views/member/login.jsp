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
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap" style="text-align: right;">
	<form action="${contextPath }/member/logChk" method="post">
		<input type="text" name="id" placeholder="input id"><br>
		<input type="text" name="pwd" placeholder="input password"><br>
		<input type="submit" value="로그인">
		<a href="${contextPath }/member/register_form">회원가입</a>
		<br>
		<input type="checkbox" name="autoLogin">자동 로그인
	</form>
</div> 
<%@ include file="../default/footer.jsp" %>
</body>
</html>









