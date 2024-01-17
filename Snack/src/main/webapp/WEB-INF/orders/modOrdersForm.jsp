<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h3>수정화면</h3>
	<form action="modifyOrders.do">
		<input type="hidden" name="orderCode" value="${vo.orderCode }">
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
				
					<input type="submit" value="저장">
					<input type="reset" value="취소">
					</td>
						
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	

