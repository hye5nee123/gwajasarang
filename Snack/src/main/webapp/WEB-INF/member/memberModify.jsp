<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
	.button_box #listBtn{margin-left:5px; color:#fff; background:#6f6f6f;}
	.w100{flex:0 0 100% !important; width:100% !important;}
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
            <form name="join" action="memberModify.do">
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
	                <input type="text" id="address" name="address" value="${vo.memberAddress}">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>이메일</p>
	                <input type="text" id="email" name="email" value="${vo.email}" readonly>
	            </div>
	            <div  class="button_box">            
		            <button type="submit" id="addBtn" class="site-btn btn-lg">수정완료</button>
		            <button type="button" id="listBtn" onclick="history.back()" class="site-btn btn-lg">목록으로</button>
	            </div>
            </form>
        </div>
    </div>
</section>
