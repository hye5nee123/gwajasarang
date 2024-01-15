<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>등록화면</h3>
<form action="addBoard.do" method="get" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th>주문번호</th>
			<td><input type="text" name="oCode" value="${orderCode }"></td>
		</tr>
		<tr>
			<th>멤버 코드</th>
			<td><textarea name="mCode" cols="30" rows="10"
					value="${memberCode }"></textarea></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><input type="text" name="date" readonly
				value="${orderDate }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>주문자</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><input type="text" name="memo"></td>
		</tr>
		<tr>
			<th>배송료</th>
			<td><input type="text" name="deliveryFee"
				value="${deliveryFee }"></td>
		</tr>
		<tr>
			<th>총 상품가격</th>
			<td><input type="text" name="totalPrice" value="${orderDate }"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="저장">
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>
