<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>게시판</h3>
<table class="table">
	<thead>
		<tr>
			<th>제목</th>
			<th>별점</th>
			<th>리뷰일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${reviewList}">
		<tr>
			<td><a href="getReview.do?reviewCode=${vo.reviewCode}">${vo.title}</a></td>
			<td>${vo.stars}</td>
			<td>${vo.reviewDate}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>