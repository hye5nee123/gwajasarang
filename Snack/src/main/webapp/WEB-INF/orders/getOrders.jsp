
<%@page import="com.yedam.orders.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<h3>상세 화면</h3>

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

				<tr>

					<td colspan="4" align="center">
					<input type="button" onclick="modifyfunc('${vo.orderCode}')" value="주문수정">
						
				    <input type="button" onclick="deletefunc('${vo.orderCode}', '${vo.memberCode}')" value="주문삭제">
				    
				   <input type="button" value="뒤로가기" onclick="history.back();" />
				    </td>
						
				</tr>

			</tbody>
		</table>
	</form>
	
</div>
<script>
	function deletefunc(orderCode, memberCode) {
		location.href = "deleteOrders.do?orderCode=" + orderCode + "&memberCode=" + memberCode;
		alert("삭제되었습니다.")
	}
	
	function modifyfunc(orderCode) {
		location.href = "modifyForm.do?orderCode=" + orderCode;
		
	}
	

</script>
