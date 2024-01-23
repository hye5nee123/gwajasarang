<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SnackSarang</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="../Snack/"><img src="bootstrap/img/logo.png" alt="과자사랑"></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="../Snack/cartList.do?memberCode=${logCode}"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
	            <li><a href="../Snack/">메인페이지</a></li>
	            <li><a href="../Snack/goodsList.do">전체상품</a></li>
		            <c:choose>
						<c:when test="${empty logId}">
							<li class="notice"><a href="#">회원정보</a></li>
			               	<li class="notice"><a href="#">주문정보</a></li>
		               	</c:when>
		               	<c:otherwise>
		               		<li><a href="../Snack/memberListForm.do?memberCode=${logCode}">회원정보</a></li>
		               		<li><a href="../Snack/ordersList.do?memberCode=${logCode}">주문정보</a></li>
		               	</c:otherwise>
					</c:choose> 
	            <li><a href="#">회사소개</a></li>
	        </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
		<div class="hero__search__phone fN">
            <div class="hero__search__phone__icon">
                <i class="fa fa-phone"></i>
            </div>
            <div class="hero__search__phone__text">
                <h5>053-777-7777</h5>
                <span>평일 9:00 ~ 18:00</span>
            </div>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <tiles:insertAttribute name="header" />
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <tiles:insertAttribute name="body" />
    <!-- Hero Section End -->

    <!-- Footer Section Begin -->
    <tiles:insertAttribute name="footer" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.nice-select.min.js"></script>
    <script src="bootstrap/js/jquery-ui.min.js"></script>
    <script src="bootstrap/js/jquery.slicknav.js"></script>
    <script src="bootstrap/js/mixitup.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/main.js"></script>
    
    <script>
	    $('.header__menu ul li').on('click', function() {
			$(this).children('a').addClass('active');
		});
    </script>
</body>

</html>