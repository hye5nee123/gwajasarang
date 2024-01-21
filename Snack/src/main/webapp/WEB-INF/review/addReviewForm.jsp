<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<h3>리뷰 등록</h3>
	<br>
	<form name="addReviewForm" action="addReview.do" method="post">
		<div class="col-lg-12">
			<div class="section-title related-blog-title">
				<h2>상품평 등록</h2>
			</div>
			<input type="hidden" name="goodsCode" value="">
			<div class="checkout__input">
				<p>제목</p>
				<input type="text" name="title" value="${result.title}">
			</div>
			<div class="checkout__input">
				<p>내용</p>
				<textarea style="width: 100%" rows="4" name="content">${result.content}</textarea>
			</div>
		</div>
		<div class="col-lg-2">
			<div class="checkout__input">
				<p>별점</p>
				<input type="number" name="stars" value="${result.stars}" min="1"
					max="5" step="1">
			</div>
		</div>
		<div class="checkout__input">
			<input type="submit" class="site-btn modbutton" id="modCheck"
				value="저장"> <input type="button" class="site-btn modbutton"
				id="modCancel" value="취소">
		</div>
	</form>
</div>
<script>
	function showReviewList(goodsCode) {
		window.location.href = "reviewList.do?goodsCode=" + goodsCode;
		console.log(reviewCode);
	}
</script>