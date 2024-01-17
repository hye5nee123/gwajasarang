<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.yedam.orders.vo.OrdersVO"%>
<div class="container">
	<h3>삭제화면</h3>
	<form name="myForm" action="remOrders.do">
		<input type="hidden" name="deleteOrders" value="${vo.orderCode }">
		<table class="table">
			<tbody>
				<tr>
					<th>주문코드</th>
					<td colspan="3">${vo.orderCode }</td>
				</tr>
				<th>회원코드</th>
				<td colspan='3'>${vo.memberCode}</td>
				</tr>
				<tr>
					<th>주문일자</th>
					<td colspan='3'>${vo.orderDate}</td>
				</tr>
				<tr>
					<th>배송주소</th>
					<td colspan='3'>${vo.orderAddress}</td>
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
			</tbody>
		</table>
	</form>
</div>