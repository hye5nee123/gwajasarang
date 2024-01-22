<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	.like_table{margin-top:50px; text-align:center; border-top:2px solid #7fad39;}
	.like_table td{vertical-align:middle;}
	.like_table td a{color:#1c1c1c;}
	.btn_close{position:relative; border:0; backround:0;}
	.btn_close span{display:block; text-indenxt:100%;}
	.btn_close span:before{content:''; display:block; position:aboslute; left:0; top:0; width:; height:; background:ulr();}
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
            <h4>좋아요</h4>
            <div class="like_table">
	            <table class="table">
	            	<colgroup>
	            		<col span="1" width=5%;>
	            		<col span="1" width=20%;>
	            	</colgroup>
	            	<thead>
	            		<tr>
	            			<th><input type="checkbox" checked></th>
	            			<th>이미지</th>
	            			<th>제품명</th>
	            			<th>금액</th>
	            			<th>삭제</th>
	            		</tr>
	            	</thead>
					<tbody>	
						<c:forEach var="vo" items="${list}">
							<tr>
								<td><input type="checkbox" class="selCheck"></td>
								<td><a href="../Snack/getGoods.do?gcode=${vo.goodsCode}"><img src="images/${vo.thumbImage}" alt="${vo.goodsName}" style="width:150px;"></a></td>
								<td><a href="../Snack/getGoods.do?gcode=${vo.goodsCode}">${vo.goodsName}</a></td>
								<td>${vo.price}</td>
								<td><button type="button" class="btn_close"><span>삭제</span></button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
        </div>
    </div>
</section>