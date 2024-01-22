<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="bootstrap/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Checkout</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>결제정보</h4>
				<form action="#">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											주문자명<span>*</span>
										</p>
										<input type="text" name="orderName" id="orderName" value="${vo.memberName }" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											수령자명<span>*</span>
										</p>
										<input type="text" class="inputbox" name="receiverName" value="${vo.memberName }">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									주소<span>*</span>
								</p>
								<input type="text" class="inputbox" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" class="inputbox" id="sample4_jibunAddress" placeholder="지번주소">
								<input type="text" class="inputbox" id="sample4_roadAddress" placeholder="도로명주소">
								<span id="guide" style="color: #999; display: none"></span>
								<input type="text" class="inputbox" id="sample4_detailAddress" placeholder="상세주소">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
							</div>
							<div class="checkout__input">
								<p>
									연락처<span>*</span>
								</p>
								<input type="text" class="inputbox" name="receiverPhone" value="${vo.memberPhone }">
							</div>
							<div class="checkout__input">
								<p>
									배송메모<span>*</span>
								</p>
								<input type="text" class="inputbox" name="memo" placeholder="배송메모를 입력해 주세요.">
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>주문내역</h4>
								<div class="checkout__order__products">
									상품명 <span>금액</span>
								</div>
								<ul>
								</ul>
								<div class="checkout__input">
								<div class="checkout__order__products">
									상품금액<span><input type="text" class="inputbox" id="totalPrice" name="totalPrice" readonly style="width:100px; height:30px; text-align:right" ></span>
									<br>
								</div>
								<div class="checkout__order__subtotal" >
									배송비<span><input type="text" class="inputbox" id="deliveryFee" name="deliveryFee" readonly style="width:100px; height:30px; text-align:right"></span>
								</div>
								<div class="checkout__order__total">
									총금액 <span id="checkTotalPrice"></span>
								</div>
								</div>
								<button type="submit" class="site-btn">주문하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
<!-- Checkout Section End -->

<script>
// cartListJson.do


showCartList(`${logCode}`)

function showCartList(logCode) {
	fetch('cartListJson.do?memberCode=' + logCode)
		.then(result => result.json())
		.then(result => {
		console.log(result);
		
		let totalPrice = 0;
		
		$(result).each((idx, cart) => {
			let span = $('<span />').text(cart.quantity * cart.price)
			let li = $('<li />').text(cart.goodsName)
			$('.checkout__order ul').append(li.append(span))
			
			totalPrice = totalPrice + cart.quantity * cart.price;
			
		})
		let fee = 0;
		
		if(totalPrice >= 30000){
			fee = 0;
			$('#deliveryFee').val(fee);
		} else {
			fee = 3000;
			$('#deliveryFee').val(fee);
		}
		$('#totalPrice').val(totalPrice);
		$('#checkTotalPrice').text(totalPrice+fee);
		
	})
	.catch(err => {
		console.error(err)
	})
}

function getAddress(){
	let address1 = document.querySelector("#sample4_jibunAddress").value;
	let address2 = document.querySelector("#sample4_roadAddress").value;
	let address3 = document.querySelector("#sample4_detailAddress").value;
	let address4 = document.querySelector("#sample4_postcode").value;
	console.log(address1, address2, address3, address4)
	
}
 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>