<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	.checkout__input input{color:#111;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
	.button_box #listBtn{margin-left:5px; color:#fff; background:#6f6f6f;}
	.w100{flex:0 0 100% !important; width:100% !important;}
	#sample4_roadAddress{margin-bottom:10px;}
	.address_box{margin-bottom:10px;}
	.address_box:after{content:''; display:block; clear:both;}
	.checkout__input input[name="postcode"]{flat:left; width:83%;}
	.checkout__input .btn_address{float:right; width:15%; padding-left:0; color:#fff; font-size:14px; background:#6f6f6f; border-radius:0;}
</style>

<section class="breadcrumb-section set-bg" data-setbg="bootstrap/img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>회원수정</h4>
            <form name="join" id="joinForm" action="memberModify.do">
            	<input type="hidden" name="checked_id" value="" />
	            <div class="checkout__input">
	                <p>아이디<span>*</span></p>
	                <div class="row">
	                	<input type="text" id="id" name="id" class="w100" value="${vo.id}" readonly>
	                </div>
	                <em></em>
	                <i></i>
	            </div>
	            <div class="checkout__input">
	                <p>비밀번호<span>*</span></p>
	                <input type="password" id="pw" name="pw">	                
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>이름<span>*</span></p>
	                <input type="text" id="name" name="name" value="${vo.memberName}" readonly>
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>연락처<span>*</span></p>
	                <input type="text" id="phone" name="phone" value="${vo.memberPhone}">
	                <em></em>
	                
	                
	            </div>
	            <div class="checkout__input">
	                <p>주소<span>*</span></p>
	                <div class="address_box">
	                	<input type="text" id="sample4_postcode" name="postcode" value="${vo.memberPostcode}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn_address">
	                </div>
	                <em></em>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
					<input type="text" id="sample4_roadAddress" name="address" value="${vo.memberAddress}">
					<em></em>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" name="addressDetail" value="${vo.memberAddressDetail}">
					<em></em>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
	            </div>
	            <div class="checkout__input">
	                <p>이메일</p>
	                <input type="text" id="email" name="email" value="${vo.email}">
	            </div>
	            <div  class="button_box">            
		            <button type="submit" id="addBtn" class="site-btn btn-lg">수정완료</button>
		            <button type="button" id="listBtn" onclick="history.back()" class="site-btn btn-lg">목록으로</button>
	            </div>
            </form>
        </div>
    </div>
</section>

<script>
	 document.querySelector('#joinForm').onsubmit = function (){		
		if($("#pw").val() != ${vo.pw}){
			alert('비밀번호가 맞지 않습니다');
			return false;
		}		
	}

	$("input").on('blur', emptyCheck)
	
	function emptyCheck(){
		if(event.target.id == "email"){
			return;
		}
		if(event.target.value == ''){
			$(this).parents('.checkout__input').find('em').html("필수입력값입니다.").addClass('warning');
			event.target.focus();
		} else{
			$(this).parents('.checkout__input').find('em').html("");
		}
	}

	function listFun(){
		document.forms.join.action = "memberListForm.do";
		document.forms.join.submit();
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
