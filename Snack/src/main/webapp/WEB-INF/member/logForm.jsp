<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원로그인</h3>
	<p>가입하신 아이디와 비밀번호를 입력해주세요.</p>
	<form>
		<table class="table">	
			<c:forEach var="vo" items="${memberList}">
				<tr>
					<td><a href="getMember.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.pw}</td>
					<td>${vo.name}</td>
					<td>${vo.responsibility}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>