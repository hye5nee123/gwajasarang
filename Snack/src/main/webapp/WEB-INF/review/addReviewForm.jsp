<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
<!DOCTYPE html>
<div class="container">
	<form name="addReviewForm" action="addReview.do" method="post">
		<div class="col-lg-12">
			<div class="section-title related-blog-title">
				<h2>상품평 등록</h2>
			</div>
			<input type="hidden" name="goodsCode" value="${goodsCode }">
			<input type="hidden" name="memberCode" id="memberCode" value="${logCode }">
			<div class="checkout__input">
				<p>작성자</p>
				<input type="text" value="${logName }" readonly>
			</div>
			<div class="checkout__input">
				<p>제목</p>
				<input type="text" name="title">
			</div>
			<div class="checkout__input">
				<p>내용</p>
				<textarea style="width: 100%" rows="4" name="content"></textarea>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="checkout__input">
				<p>작성일자</p>
				<input type="text" id="reviewDate">
			</div>
		</div>
		<div class="col-lg-2">
			<div class="checkout__input">
				<p>별점</p>
				<input type="number" name="stars" min="1" max="5" step="1" value="5">
			</div>
		</div>
		<div class="checkout__input">
			<input type="submit" class="site-btn modbutton" id="modCheck" value="저장">
			<input type="button" class="site-btn modbutton" id="modCancel" value="취소">
		</div>
	</form>
</div>
<script>
	function showReviewList(goodsCode) {
		window.location.href = "reviewList.do?goodsCode=" + goodsCode;
		console.log(reviewCode);
	}
	// 오늘 날짜
	let today = new Date();
	let dateFormat = today.getFullYear() + '년 ' + (today.getMonth()+1) + '월 '
		+ today.getDate() + '일 ';
	$('#reviewDate').val(dateFormat)
</script>