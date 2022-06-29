<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap" >
<table  class="table" style="width: 70%; margin: auto;">
	<tr>
		<th>아이디</th> <th>비밀번호</th> <th>주소</th>
	</tr>
	<c:forEach var="dto" items="${memberList }">
	<tr>
		<td>
			<a href="info?id=${dto.id }">
				${dto.id }
			</a>
		</td> 
	
		<td>${dto.pw }</td>
		<td>${dto.addr }</td>
	</tr>
	</c:forEach>	
	
</table>	
</div> 
<%@ include file="../default/footer.jsp" %>
</body>
</html>











