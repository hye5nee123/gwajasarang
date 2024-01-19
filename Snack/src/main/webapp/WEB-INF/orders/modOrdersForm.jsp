<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h3>수정화면</h3>
	<form action="modifyOrders.do">
		<input type="hidden" name="orderCode" value="${vo.orderCode }">
		<input type="hidden" name="memberCode" value="${vo.memberCode }">
		<table class="table">
			<tbody>
				<tr>
					<td>배송주소</td>
					<td colspan="3"><input type="text" name="orderAddress" value="${vo.orderAddress }"></td>
				</tr>
				<tr>
					<td>수령인</td>
					<td colspan="3"><input type="text" name="orderName" value="${vo.orderName }"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="3"><input type="text" name="orderPhone" value="${vo.orderPhone }"></td>
				</tr>
				<tr>
					<td>메모</td>
					<td colspan="3"><input type="text" name="memo" value="${vo.memo }"></td>
				</tr>
				<tr>
				<td colspan="4" align="center">
					<input type="submit" value="저장" onclick="alert('수정되었습니다.')" >
					</form>
					<input type="button" value="뒤로가기" onclick="history.back();" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script>
	function cancelfunc(orderCode){
		location.href = "ordersList.do?orderCode=" + orderCode + "&memberCode=" + memberCode;
		alert("처음으로 돌아갑니다.");
	}



	}
</script>