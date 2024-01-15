<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="section-title related-blog-title">
		    <h2>회원로그인</h2>
			<div class="product__details__text mt-5">
				<p>가입하신 아이디와 비밀번호를 입력해주세요.</p>
			</div>
		</div>
		<form>
			<div class="checkout__order col-lg-6 mx-auto">	
				<div class="checkout__input">
					<p class="checkout__order__products">아이디</p>
					<input type="text" name="m_id">
				</div>
				<div class="checkout__input">
					<p class="checkout__order__products">비밀번호</p>
					<input type="password" name="m_pw">
				</div>
				<button class="site-btn">로그인</button>
			</div>
		</form>
	</div>
</section>
