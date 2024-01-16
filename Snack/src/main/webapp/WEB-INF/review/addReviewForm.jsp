<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<h3>리뷰 등록</h3><br>
	<form name="addReviewForm" action="addReview.do" method="post">
		<input type="hidden" name="goodsCode" value="${goodsCode }">
		<table class="table">
			<tr>
				<th>상품코드</th>
				<td>${goodsCode}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" cols="30" rows="10"></textarea></td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="number" max="5" min="0" step="1" value="5" name="stars"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
					<input type="button" value="취소" onclick="showReviewList(`${goodsCode}`)">
				</td>
			</tr>
		</table>
	</form>
</div>
<script>
function showReviewList(goodsCode){
	window.location.href = "reviewList.do?goodsCode=" + goodsCode;
	console.log(reviewCode);
}	
</script>