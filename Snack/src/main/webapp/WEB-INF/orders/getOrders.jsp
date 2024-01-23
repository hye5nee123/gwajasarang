<%@page import="com.yedam.orders.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	.order_tbl{border-top:2px solid #7fad39;}
	.site-btn{border-radius:.3rem;}
	input[type="button"]:nth-child(2){background:#6f6f6f;} 
	input[type="button"]:last-child{color:#111; border:1px solid #ddd; background:#fff;} 
</style>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 카테고리</span>
                        </div>
                        <ul>
                            <li><a href="goodsList.do?category=과자">과자</a></li>
                            <li><a href="goodsList.do?category=비스킷/크래커">비스킷/크래커</a></li>
                            <li><a href="goodsList.do?category=쿠키/파이">쿠키/파이</a></li>
                            <li><a href="goodsList.do?category=유기농/전통과자">유기농/전통과자</a></li>
                            <li><a href="goodsList.do?category=초콜릿">초콜릿</a></li>
                            <li><a href="goodsList.do?category=젤리/캐러멜">젤리/캐러멜</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
<!--                                 <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div> -->
                                <input type="text" id="searchBox" placeholder="검색어를 입력해주세요">
                                <button type="button" class="site-btn" onclick="searchFunc()">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>053-777-7777</h5>
                                <span>평일 9:00 ~ 18:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="breadcrumb-section set-bg" data-setbg="bootstrap/img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
			<h4>주문 상세</h4>
			<div class="row">
				<div class="col-lg-8">
					<form name="myForm">
						<input id="c" type="hidden" name="orderCode" value="${vo.orderCode }">
						<table class="table order_tbl">
							<tbody>
								<tr>
									<th>주문코드</th>
									<td colspan='3'>${vo.orderCode}</td>
								</tr>
								<tr>
									<th>회원코드</th>
									<td colspan='3'>${vo.memberCode}</td>
								</tr>
								<tr>
									<th>주문일자</th>
									<td colspan='3'>${vo.orderDate}</td>
								</tr>
								<tr>
									<th>배송주소</th>
									<td colspan='3'>${vo.orderAddress} ${vo.orderAddressDetail}</td>
									
								</tr>
								<tr>
									<th>수령인</th>
									<td colspan='3'>${vo.orderName}</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan='3'>${vo.orderPhone}</td>
								</tr>
								<tr>
									<th>배송메모</th>
									<td colspan='3'>${vo.memo}</td>
								</tr>
								<tr>
									<th>배송비</th>
									<td colspan='3'>${vo.deliveryFee}</td>
								</tr>
								<tr>
									<th>총주문금액</th>
									<td colspan='3'>${vo.totalPrice}</td>
								</tr>
		
								<tr>
		
									<td colspan="4" align="center">
									  <input type="button"
										onclick="modifyfunc('${vo.orderCode}')" value="수정" class="site-btn"> 
									  <input type="button"
										onclick="deletefunc('${vo.orderCode}', '${vo.memberCode}')"
										value="삭제" class="site-btn"> 
									  <input type="button" value="뒤로"
										onclick="history.back();"/ class="site-btn"></td>
								</tr>
		
							</tbody>
						</table>
					</form>
				</div>
				<div class="col-lg-4">
					<div class="checkout__order">
						<h4>주문 상품</h4>
						
						<ul id="detailList">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>	
<!-- 페이징 처리 -->
<div id="paging" class="col-lg-12 product__pagination">
</div>

<script>
	showDetailList(`${vo.orderCode}`)


	// 삭제
	function deletefunc(orderCode, memberCode) {
		console.log(orderCode, memberCode)
		
		
			location.href = "deleteOrders.do?orderCode=" + orderCode + "&memberCode=" + memberCode;
		alert("삭제되었습니다.")
	}
	
	//수정

	function modifyfunc(orderCode) {
		location.href = "modifyForm.do?orderCode=" + orderCode;
	}
	
	//돌아가기
	function backfunc(orderCode, memberCode){
		location.href = "ordersList.do?memberCode=" + orderCode + "&memberCode=" + memberCode;
		alert("목록으로 돌아갑니다.")
	}
	//주문상세내역
	function showDetailList(orderCode){
		fetch("detailListJson.do" ,{
			method:'post',
			headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
			body: 'orderCode=' + orderCode
		})
		.then(res => res.json())
		.then(res=>{
			console.log(res);			
			$(res).each((idx, item)=>{
				let li= $('<li />').text(item.goodsName);
				let span = $('<span />').text(item.quantity);
				console.log(item)
				let button;
				if(item.reviewCode == 0){
					button = $('<span />').append($(`<input type="button" onclick="addReviewFunc('\${item.detailCode}')" />`).val('리뷰작성'));
				}
				else {
					button = $('<span />').append($(`<input type="button" onclick="getReviewFunc('\${item.reviewCode}')" />`).val('리뷰보기'));
				}
				
				
				$('#detailList').append(li.append(span)).append(button);
				
			})
		})
	}

	function addReviewFunc(detailCode){
		location.href ='addReviewForm.do?detailCode=' + detailCode;
	}
	
	function getReviewFunc(reviewCode){
		location.href ='getReview.do?reviewCode=' + reviewCode;
	}
</script>
