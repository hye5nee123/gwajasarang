<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>상세화면</h3>
<form name="myForm">
	<input type="hidden" name="reviewCode" value="${vo.reviewCode}">
	<table class="table">
		<tbody>
			<tr>
				<th>리뷰 번호</th>
				<td colspan='3'>${vo.reviewCode}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${vo.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${vo.content}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${vo.reviewDate}</td>
			</tr>
			

		</tbody>
	</table>
</form>