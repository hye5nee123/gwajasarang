<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<style>
	.log_name{font-style:normal; font-weight:700;}
</style>

<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li>
                            	<c:choose>
	           						<c:when test="${empty logId}">
	                            		로그인을 해주세요.
	                            	</c:when>
	                            	<c:otherwise>
	                            		<i class="log_name">${logName}</i>님 환영합니다.
	                            	</c:otherwise>
					        	</c:choose> 
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__auth">
           					<c:choose>
           						<c:when test="${empty logId}">
                            		<a href="loginForm.do"><i class="fa fa-user"></i> Login</a>
                            	</c:when>
                            	<c:otherwise>
                            		<a href="logout.do" class="logout"><i class="fa fa-user"></i> Logout</a>
                            	</c:otherwise>
				        	</c:choose> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="../Snack/"><img src="bootstrap/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="../Snack/">메인페이지</a></li>
                        <li><a href="../Snack/goodsList.do">전체상품</a></li>
                        <c:choose>
          					<c:when test="${empty logId}">
          						<li class="notice"><a href="#">회원정보</a></li>
                           		<li class="notice"><a href="#">주문정보</a></li>
                           	</c:when>
                           	<c:otherwise>
                           		<li><a href="../Snack/memberSelect.do?memberCode=${logCode}">회원정보</a></li>
                           		<li><a href="../Snack/ordersList.do?memberCode=${logCode}">주문정보</a></li>
                           	</c:otherwise>
			        	</c:choose> 
                        <li><a href="#">회사소개</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="../Snack/likeList.do?&membercode=${logCode}"><i class="fa fa-heart"></i></a></li>
                        <li><a href="../Snack/cartList.do?memberCode=${logCode }"><i class="fa fa-shopping-bag"></i></a></li>                        
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>

<script>
	$('.notice').on('click', function() {
		alert("로그인을 해주세요.");
	})
</script>
