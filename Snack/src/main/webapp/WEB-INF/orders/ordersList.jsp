<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
.ordercodeH:hover {background-color: gold;}
.order_tbl{border-top:2px solid #7fad39;}
.order_tbl td a{color:#111;}
.product__pagination{text-align:center;}
.product__pagination .pageInfo{display:inline-block;}
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
        <div class="container checkout__form">
			<h4>주문조회</h4>
			<table class="table order_tbl">
				<thead>
					<tr>
						<th>주문코드</th>
						<th>주문일자</th>
						<th>배송주소</th>
						<th>수령인</th>
						<th>배송비</th>
						<th>총주문금액</th>
						
		
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${ordersList}">
						<tr>
							<td class="ordercodeH"><a href="getOrders.do?orderCode=${vo.orderCode }">${vo.orderCode }</a></td>
							<td>${vo.orderDate }</td>
							<td>${vo.orderAddress } ${vo.orderAddressDetail }</td>
							<td>${vo.orderName }</td>
							<td>${vo.deliveryFee }</td>
							<td>${vo.totalPrice }</td>
							
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			<div class="product__pagination">
				<c:forEach var="i" begin="${dto.startPage }" end="${dto.lastPage }">
					<div class="pageInfo" display="inline-block">
						<a href="ordersList.do?page=${i }">${i }</a>
					</div>
				</c:forEach>
				<a href="#"><i class="fa fa-long-arrow-right"></i></a>
			</div>
		</div>
	</div>
</section>
<script>
function getOrder((orderCode){
	location.href="getOrders.do?orderCode=" + orderCode
}
}
</script>