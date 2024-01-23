<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!DOCTYPE html>
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<form name="addReviewForm" action="addReview.do" method="post">
				<div class="col-lg-12">
					<div class="section-title related-blog-title">
						<h2>상품평 등록</h2>
					</div>
					<input type="hidden" name="orderCode" value="${vo.orderCode }">
					<input type="hidden" name="detailCode" value="${detailCode }">
					<input type="hidden" name="goodsCode" value="${vo.goodsCode }">
					<input type="hidden" name="memberCode" value="${logCode }">
					<div class="checkout__input">
						<p>상품명</p>
						<input type="text" value="${vo.goodsName }" readonly>
					</div>
					<div class="checkout__input">
						<p>작성자</p>
						<input type="text" value="${logName }" readonly>
					</div>
					<div class="checkout__input">
						<p>
							제목<span>*</span>
						</p>
						<input type="text" name="title" required> <em></em>
					</div>
					<div class="checkout__input">
						<p>
							내용<span>*</span>
						</p>
						<textarea style="width: 100%" rows="4" name="content" required></textarea>
						<em></em>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="checkout__input">
						<p>
							별점<span>*</span>
						</p>
						<input type="number" name="stars" min="1" max="5" step="1"
							value="5" required> <em></em>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="checkout__input">
						<p>작성일자</p>
						<input type="text" id="reviewDate" readonly>
					</div>
				</div>
				<div class="checkout__input">
					<input type="submit" class="site-btn modbutton" id="modCheck" value="저장">
					<input type="button" class="site-btn modbutton" id="modCancel" onclick="history.back()" value="취소">
				</div>
			</form>
		</div>
	</div>
</section>
<script>

$("textarea").on('blur', emptyCheck)
$("input").on('blur', emptyCheck)

function showReviewList(goodsCode) {
	window.location.href = "reviewList.do?goodsCode=" + goodsCode;
}
// 오늘 날짜
let today = new Date();
let dateFormat = today.getFullYear() + '년 ' + (today.getMonth() + 1) + '월 '
		+ today.getDate() + '일 ';
$('#reviewDate').val(dateFormat)

function emptyCheck() {
	if (event.target.value == '') {
		$(this).parents('.checkout__input').find('em').html("필수입력값입니다.").addClass('warning');
		//event.target.focus();
	} else {
		$(this).parents('.checkout__input').find('em').html("");
	}
}


</script>