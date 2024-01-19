<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="container">
	<h3>수정화면</h3>
	<form action="modifyOrders.do">
		<input type="hidden" name="orderCode" value="${vo.orderCode }">
		<input type="hidden" name="memberCode" value="${vo.memberCode }">
		<input type="hidden" name="orderAddress" value="getAddress()">
		<table class="table">
			<tbody>
				<tr>
					<td>배송주소</td>
					<td colspan="3">
                    <input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                    <!--  <input type="hidden" name="orderAddress" value="${vo.orderAddress }">-->
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                    </td>
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
					
					<input type="button" value="뒤로가기" onclick="history.back();" />
					</td>
				</tr>
			</tbody>
		
			
			
		</table>
		
		<script>
		function getAddress(){
			let address1 = document.querySelector("#sample4_jibunAddress").value;
			let address2 = document.querySelector("#sample4_roadAddress").value;
			let address3 = document.querySelector("#sample4_detailAddress").value;
			let address4 = document.querySelector("#sample4_postcode").value;
			console.log(address1, address2, address3, address4)
			
		}
		 function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("sample4_extraAddress").value = '';
		                }

		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';

		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		 	
			</script>
	</form>
	</div>
	
	<script>
	function cancelfunc(orderCode){
		location.href = "ordersList.do?orderCode=" + orderCode + "&memberCode=" + memberCode;
		alert("처음으로 돌아갑니다.");
	}
	
	
</script>