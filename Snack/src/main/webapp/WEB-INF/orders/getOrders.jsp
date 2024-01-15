    <%@page import="com.yedam.orders.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>상세 화면</h3>

<form name="mtForm">
<input type="hidden" name="orderCode" value="${vo.orderCode }">
<table calss="table" border = "2">
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
				<td colspan="4" align="center"><c:choose>
						<c:when >
							<input type="submit" value="주문수정">
							<input type="button"  onclick="deleteFun()" value="주문취소">
						</c:when>
						
					</c:choose></td>
			</tr>
</tbody>
</table>
</form>