<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>게시판</h3>
<table class="table">
	<thead>
		<tr>
			<th>리뷰코드</th>
			<th>상품코드</th>
			<th>제목</th>
			<th>내용</th>
			<th>별점</th>
			<th>리뷰일자</th>
		</tr>
	</thead>
	<tbody>
		<h1>${reviewList}</h1>
		<c:forEach var="vo" items="${reviewList}">
		<tr>
			<td>${vo.reviewCode}</td>
			<td>${vo.goodsCode}</td>
			<td>${vo.title}</td>
			<td>${vo.content}</td>
			<td>${vo.star}</td>
			<td>${vo.reviewDate}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>