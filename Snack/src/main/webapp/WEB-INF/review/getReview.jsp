<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<h3>상세화면</h3>
	<br>
	<form>
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
					<th>별점</th>
					<td colspan="3">${vo.stars }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${vo.reviewDate}</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="수정" onclick="modFunc(`${vo.reviewCode}`)"> 
						<input type="button" value="삭제" onclick="delFunc(`${vo.reviewCode}`)"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<script>
	function modFunc(reviewCode) {
		window.location.href = "modReviewForm.do?reviewCode=" + reviewCode
	}
	function delFunc(reviewCode) {
		window.location.href = "delReviewForm.do?reviewCode=" + reviewCode
	}
</script>