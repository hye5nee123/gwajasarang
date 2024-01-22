<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 배너 Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="bootstrap/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Snack Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="../Snack/">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<form name="modReviewForm" action="modReview.do" method="post">
				<div class="col-lg-12">
					<h4>상품평 수정</h4>
					<div class="checkout__input">
						<p>리뷰 번호</p>
						<input type="text" value="${vo.reviewCode}" name="reviewCode" readonly>
					</div>
					<div class="checkout__input">
						<p>상품명</p>
						<input type="text" value="${vo.goodsName}" readonly>
					</div>
					<div class="checkout__input">
						<p>제목</p>
						<input type="text" value="${vo.title}" name="title" required>
					</div>
					<div class="checkout__input">
						<p>내용</p>
						<textarea rows="10" style="width:100%;" name="content" required>${vo.content}</textarea>
					</div>
					<div class="col-lg-2">
		                <div class="checkout__input">
		                    <p>별점</p>
		                    <input type="number" name="stars" value="${vo.stars}" min="1" max="5" step="1">
		                </div>
	                </div>
					<div class="checkout__input">
						<p>작성일자</p>
						<input type="text" value="${vo.reviewDate}" readonly>
					</div>
					<div class="checkout__input">
						<input type="submit" value="확인" >
						<input type="button" value="취소" onclick="history.back()">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script>

$('input[type="button"]').css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		'marginRight': '5px'
	});
$('input[type="button"]').hover(function() {
	$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
}, function() {
	$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
});
$('input[type="submit"]').hover(function() {
	$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
}, function() {
	$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
});
</script>