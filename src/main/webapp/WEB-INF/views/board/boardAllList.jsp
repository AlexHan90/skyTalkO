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
<c:import url="../default/header.jsp"/>
<div class="wrap">
<div align="center">
	<h3>게 시 판</h3>
	<table border="1">
		<tr>
			<th>번호</th> <th>id</th> <th>제목</th> <th>날짜</th>
			<th>조회수</th> <th>image_file_name</th>
		</tr>
		
		<c:if test="${boardList.size() == 0 }">
		<tr>
			<th colspan="6">
				등록된 글이 없습니다
			</th>
		</tr>
		</c:if>
		
		<c:forEach var="dto" items="${boardList}">
		<tr>
			<td>${dto.writeNo }</td> <td>${dto.id }</td>
			
			<td>
				<a href="${contextPath }/board/contentView?writeNo=${dto.writeNo }">
					${dto.title }
				</a>
			</td> 
			
			<td>${dto.saveDate }</td>
			<td>${dto.hit }</td> <td>${dto.imageFileName }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">
			
<div align="left">
	<c:forEach var="num" begin="1" end="${repeat }">
		<a href="boardAllList?num=${num }">[${num }]</a>
	</c:forEach>
</div>
				
				<a href="${contextPath }/board/writeForm">글쓰기</a>
			</td>
		</tr>
	</table>








</div>
</div>


</body>
</html>























