<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 배너 Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="bootstrap/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Snack Shop</h2>
					<div class="breadcrumb__option">
						<a href="../Snack/">Home</a> <span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="container">
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<div class="col-lg-12">
					<h4>상품평 상세조회</h4>
					<div class="checkout__input">
						<p>리뷰 번호</p>
						<input type="text" value="${vo.reviewCode}" readonly>
					</div>
					<div class="checkout__input">
						<p>상품명</p>
						<input type="text" value="${vo.goodsName}" readonly>
					</div>
					<div class="checkout__input">
						<p>제목</p>
						<input type="text" value="${vo.title}" readonly>
					</div>
					<div class="checkout__input">
						<p>내용</p>
						<input type="text" value="${vo.content}" readonly>
					</div>

					<div class="checkout__input">
						<p>별점</p>
						<span class="stars2"></span>
					</div>
					<div class="checkout__input">
						<p>작성일자</p>
						<input type="" value="${vo.reviewDate}" readonly>
					</div>
					<div class="checkout__input">
						<input type="button" value="수정" onclick="modFunc(`${vo.reviewCode}`)">
						<input type="button" value="삭제" onclick="delFunc(`${logCode}`, `${vo.memberCode}`, `${vo.reviewCode}`))">
						<input type="button" value="목록으로" onclick="history.back()">

					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
function modFunc(reviewCode) {
	window.location.href = "modReviewForm.do?reviewCode=" + reviewCode;
}
function delFunc(logCode, memberCode, reviewCode) {
	console.log(this)
	if (logCode == '') {
		alert('로그인 후 삭제 가능합니다.');
	}
	else if (logCode != memberCode) {
		alert('상품평 삭제 권한이 없습니다.');
	}
	else if (logCode == memberCode) {
		if (confirm("상품평을 삭제하시겠습니까?")) {
			fetch('/remReviewJson.do', {
				method: 'post',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'reviewCode=' + reviewCode
		    })
		        .then(result => result.json())
		        .then(result => {
		            console.log(result);
		            if (result.retCode == 'OK') {
		                alert('상품평이 삭제되었습니다.');
		                window.location.href = "getOrders.do"
		            } else if (result.retCode == 'NG') {
		                alert('상품평 삭제에 실패하였습니다.');
		            }
		        });
	    	}		
		}
	}

}

for (i = 0; i < `${vo.stars }`; i++) {
	$('.stars2').append($('<i class="fa fa-star" />'))
}

$('input').css('color','black')
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
</script>