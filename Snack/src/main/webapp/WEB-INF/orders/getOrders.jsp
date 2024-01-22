<%@page import="com.yedam.orders.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<div class="container">
	<h3>주문 상세</h3>
	<div class="row">
		<div class="col-lg-8">
			<form name="myForm">
				<input id="c" type="hidden" name="orderCode" value="${vo.orderCode }">
				<table class="table" border="2">
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
								onclick="modifyfunc('${vo.orderCode}')" value="수정"> 
							  <input type="button"
								onclick="deletefunc('${vo.orderCode}', '${vo.memberCode}')"
								value="삭제"> 
							  <input type="button" value="뒤로"
								onclick="history.back();"/></td>
						</tr>

					</tbody>
				</table>
			</form>
		</div>
		<div class="col-lg-4">
			<div class="checkout__order">
				<h4>주문 상세</h4>
				
				<ul id="detailList">
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 페이징 처리 -->
<div id="paging" class="col-lg-12 product__pagination"></div>

<script>
	showDetailList(`${vo.orderCode}`)


	// 삭제
	function deletefunc(orderCode, memberCode) {
		console.log(orderCode, memberCode)
		//  if넣어서 상태체크 맞으면 보내고 안맞으면 뒤로
		
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
