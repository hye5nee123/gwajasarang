<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
	.member_table{margin-top:50px !important;}
	.member_table table{border-top:2px solid #7fad39;}
	.member_table table tr:last-child{border-bottom:1px solid #dee2e6;}	
	.member_table table th p{position:relative; margin-bottom:0; color:#1c1c1c; font-size:17px; font-weight:700;}
	.member_table table th p:after{content:''; display:block; position:absolute; right:0; top:50%; width:1px; height:20px; margin-top:-10px; background:#dee2e6;}
	.member_table + .button_box{margin-top:30px !important;}
	.member_table + .button_box button:last-child{margin-left:5px; color:#fff; background:#6f6f6f;}
</style>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 카테고리</span>
                        </div>
                        <ul>
                            <li><a href="goodsList.do?category=과자">과자</a></li>
                            <li><a href="goodsList.do?category=비스킷/크래커">비스킷/크래커</a></li>
                            <li><a href="goodsList.do?category=쿠키/파이">쿠키/파이</a></li>
                            <li><a href="goodsList.do?category=유기농/전통과자">유기농/전통과자</a></li>
                            <li><a href="goodsList.do?category=초콜릿">초콜릿</a></li>
                            <li><a href="goodsList.do?category=젤리/캐러멜">젤리/캐러멜</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
<!--                                 <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div> -->
                                <input type="text" id="searchBox" placeholder="검색어를 입력해주세요">
                                <button type="button" class="site-btn" onclick="searchFunc()">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>053-777-7777</h5>
                                <span>평일 9:00 ~ 18:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
            <h4>회원정보</h4>
            <form name="myForm" method="post" action="memberModifyForm.do?memberCode=${logCode}">
	            <div class="member_table">
		            <table class="table">
		            	<colgroup>
		            		<col span="1" width="15%";>
		            	</colgroup>
						<tbody>	
							<tr>
								<th><p>아이디</p></th>	
								<td>${vo.id}</td>
							</tr>
							<tr>
								<th><p>이름</p></th>
								<td>${vo.memberName}</td>
							</tr>
							<tr>	
								<th><p>연락처</p></th>
								<td>${vo.memberPhone}</td>
							</tr>
							<tr>	
								<th><p>주소</p></th>
								<td>${vo.memberAddress} ${vo.memberAddressDetail}</td>
							</tr>
							<tr>	
								<th><p>이메일</p></th>
								<td>${vo.email}</td>
							</tr>
						</tbody>
					</table>
				</div>	
				<div class="button_box">            
		            <button type="submit" id="modBtn" class="site-btn btn-lg">정보수정</button>
		            <button type="button" id="mainBtn" onclick="mainFun()" class="site-btn btn-lg">메인으로</button>
	            </div>
			</form>
        </div>
    </div>
</section>

<script>
	function mainFun(){
		document.forms.myForm.action = "mainPage.do";
		document.forms.myForm.submit();
	}
</script>
