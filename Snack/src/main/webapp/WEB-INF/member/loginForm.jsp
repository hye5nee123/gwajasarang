<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	input{color:#1c1c1c !important;}
	table{margin-top:30px; border-top:1px solid #ececec;}
	table a{display:block; position:relative; color:#6f6f6f; font-size:16px;}
	table td:first-child a:before{content:''; display:block; position:absolute; right:0; top:50%; width:1px; height:30px; background:#ccc; margin-top:-15px;}
	table a:hover{color:#1c1c1c;}
</style>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <li><a href="#">Fresh Meat</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruit &amp; Nut Gifts</a></li>
                        <li><a href="#">Fresh Berries</a></li>
                        <li><a href="#">Ocean Foods</a></li>
                        <li><a href="#">Butter &amp; Eggs</a></li>
                        <li><a href="#">Fastfood</a></li>
                        <li><a href="#">Fresh Onion</a></li>
                        <li><a href="#">Papayaya &amp; Crisps</a></li>
                        <li><a href="#">Oatmeal</a></li>
                        <li><a href="#">Fresh Bananas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
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
		<form action="mainPage.do" method="post">
			<div class="checkout__order col-lg-6 mx-auto">	
				<div class="checkout__input">
					<p class="checkout__order__products">아이디</p>
					<input type="text" name="m_id" placeholder="아이디">
				</div>
				<div class="checkout__input">
					<p class="checkout__order__products">비밀번호</p>
					<input type="password" name="m_pw" placeholder="비밀번호">
				</div>
				<button class="site-btn">로그인</button>
			</div>
			<div class="col-lg-6 mx-auto shoping__cart__table mt-2 p-0">
				<table>
					<colgroup>
						<col span="2" width="50%">
					</colgroup>
					<tr>
						<td>
							<a href="memberAddForm.do">회원가입</a>
						</td>
						<td>
							<a href="#">아이디/비밀번호 찾기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</section>
