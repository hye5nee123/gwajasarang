
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
				    
				   <input type="button" value="뒤로가기" onclick="history.back();"/>
				    </td>
						
				</tr>

			</tbody>
		</table>
	</form>
	
</div>
<!-- 페이징 처리 -->
<div id = "paging" class="pagination">
</div>

<script>
	function deletefunc(orderCode, memberCode) {
		location.href = "deleteOrders.do?orderCode=" + orderCode + "&memberCode=" + memberCode;
		alert("삭제되었습니다.")
	}
	
	function modifyfunc(orderCode) {
		location.href = "modifyForm.do?orderCode=" + orderCode;
		
	}
	function backfunc(orderCode, memberCode){
		location.href = "ordersList.do?memberCode=" + orderCode + "&memberCode=" + memberCode;
		alert("목록으로 돌아갑니다.")
	}
	
	//페이지 클릭하면 페이지의 데이터 보여주도록하기.
	let pageInfo = 1;
	function pageList(e){
		e.preventDefault();
		pageInfo = this.getAttribute("href");
		showList(pageInfo);

			
	//페이지를 생성하는 함수를 호출.
	pagingList(pageInfo);
	}

	//Ajax 호출
	function showList_backup(page){
		ul.innerHTML = '';
		const xhtp = new XMLHttpRequest();
		xhtp.open('get','OrdersListJson.do?memberCode=' + memberCode+ "&page=" + page);
		xhtp.send();
		xhtp.onload = function(){
			
			let data = JSON.parse(xhtp.responseText); //json문자열 -> 객체
			data.forEach(order => {
				//시작.
				let li = makeLi(order);
				ul.appendChild(li);
			})
		}
	}//
	function showList(page){
		ul.innerHTML = '';
		fetch("OrdersListJson.do?memberCode=" + memberCode+ "&page=" + page)
		.then(str => str.json())
		.then(result=>{
			result.forEach(order=>{
				let li = makeLi(order);
				ul.appendChild(li);
			})
		})
		.catch(reject => console.log(reject));
	}
	showList(pageInfo);

	//페이지 생성.
	let paging = document.querySelector('#paging');
	pagingList();

	function pagingList(page=1){
		//다음 페이지를 기준으로 페이지 목록 생성.
		paging.innerHTML='';

		let pagingAjax = new XMLHttpRequest();
	pagingAjax.open('get', 'pagingListJson.do?memberCode='+memberCode+'&page=' + page);
	pagingAjax.send();
	pagingAjax.onload = function(){
		let result = JSON.parse(pagingAjax.responseText);
		console.log(result);
		//이전페이지.
		if(result.prev){
			let aTag = document.createElement('a');
			aTag.href = result.startPage -1;
			aTag.innerText = '이전';
			aTag.addEventListener('click', pageList);
			paging.appendChild(aTag);
		}
		//페이지목록.
		for(let p = result.startPage; p <= result.lastPage; p++){
			let aTag = document.createElement('a');
			if(p == page) {
				aTag.setAttribute('class', 'active');
			}
			aTag.href = p;
			aTag.innerText = p;
			aTag.addEventListener('click', pageList);
			paging.appendChild(aTag);
		}
		// 다음페이지.
		if(result.next){
			let aTag = document.createElement('a');
			aTag.href = result.lastPage +1;
			aTag.innerText = '다음';
			aTag.addEventListener('click', pageList);
			paging.appendChild(aTag);

		
		}
		
	
	

</script>
