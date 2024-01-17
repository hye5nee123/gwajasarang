<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
<form action="modReview.do">
<h3>리뷰 수정</h3>
	<table class="table">
		<tbody>
			<tr>
				<th>리뷰코드</th>
				<td colspan='5'>${vo.reviewCode}</td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td colspan='5'>${vo.goodsCode}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5"><input type="text" name="title" value="${vo.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><textarea cols="30" rows="4" name="content">${vo.content }</textarea></td>
			</tr>
			<tr>
				<th>별점</th>
				<td colspan="5"><input type="number" name="stars" value="${vo.stars }"></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="5">${vo.reviewDate }</td>
			</tr>
				<tr>
					<td colspan="5" align="center">
					<input type="submit" value="저장">
					<input type="button" value="취소" onclick="showGetReview(`${vo.reviewCode}`)">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
<script>
function showGetReview(reviewCode){
	window.location.href = "getReview.do?reviewCode=" + reviewCode;
	console.log(reviewCode);
}	
</script>