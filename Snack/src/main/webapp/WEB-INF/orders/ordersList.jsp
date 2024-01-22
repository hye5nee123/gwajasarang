<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
a:hover {
	background-color: gold;
}
</style>

<div class="container">
	<h3>주문조회</h3>
	<table class="table">
		<thead>
			<tr>
				<th>주문코드</th>
				<th>회원코드</th>
				<th>주문일자</th>
				<th>배송주소</th>
				<th>수령인</th>
				<th>연락처</th>
				<th>배송메모</th>
				<th>배송비</th>
				<th>총주문금액</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${ordersList}">
				<tr>
					<td><a href="getOrders.do?orderCode=${vo.orderCode}">${vo.orderCode }</a></td>
					<td>${vo.memberCode }</td>
					<td>${vo.orderDate }</td>
					<td>${vo.orderAddress } ${vo.orderAddressDetail }</td>
					<td>${vo.orderName }</td>
					<td>${vo.orderPhone }</td>
					<td>${vo.memo }</td>
					<td>${vo.deliveryFee }</td>
					<td>${vo.totalPrice }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="product__pagination">
		<c:forEach var="i" begin="${dto.startPage }" end="${dto.lastPage }">
			<div class="pageInfo" display="inline-block">
				<a href="ordersList.do?page=${i }">${i }</a>
			</div>
		</c:forEach>
		<a href="#"><i class="fa fa-long-arrow-right"></i></a>
	</div>
</div>