<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>수정화면</h3>
<form action="modifyOrders.do">
<input type="hidden" name="ordersCode" value="${vo.orderCode }">
<input type="hidden" name="memberCode" value="${vo.memberCode }">

        <table class="table">
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
        <td colspan='3'><input type="text" name="ordersaddress">${vo.orderAddress}</td>
    </tr>
    <tr>
        <th>수령인</th>
        <td colspan='3'><input type="text" name="ordersname">${vo.orderName}</td>
    </tr>
    <tr>
        <th>연락처</th>
        <td colspan='3'><input type="text" name="orderPhone">${vo.orderPhone}</td>
    </tr>
    <tr>
        <th>배송메모</th>
        <td colspan='3'><input type="text" name="memo">${vo.memo}</td>
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
            <input type="submit" value="완료" class="btn btn-primary"> 
            <input type="reset" value="취소" class="btn btn-warning"></td>
    </tr>
</tbody>
 </table>
 </form>
