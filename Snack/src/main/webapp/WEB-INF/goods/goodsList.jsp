<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html> -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
     <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- 	 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet"> -->


    <!-- Css Styles -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">
</head>

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Category</h4>
                            <ul>
                                <li><a href="#">과자/쿠키</a></li>
                                <li><a href="#">초콜릿/젤리</a></li>
                                <li><a href="#">캔디/껌</a></li>
                                <li><a href="#">음료/커피</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>추천상품</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="bootstrap/img/product/discount/pd-1.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                     	    <c:forEach var="vo" items="${goodsList }">
                                            <span>Dried Fruit</span>
                                            </c:forEach>
                                            <h5><a href="#">${vo.goodsName }</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach var="vo" items="${goodsList }">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="images/${vo.thumbImage }">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${vo.goodsName }</a></h6>
                                    <h5>${vo.price }원</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Product Section End -->
    
        <!-- Js Plugins -->
    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery.nice-select.min.js"></script>
    <script src="bootstrap/js/jquery-ui.min.js"></script>
    <script src="bootstrap/js/jquery.slicknav.js"></script>
    <script src="bootstrap/js/mixitup.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/main.js"></script>

<h3>상품목록</h3>
<table>
	<thead>
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>제조사</th>
			<th>가격</th>
			<th>카테고리</th>
			<th>썸네일</th>
			<th>상세이미지</th>
		</tr>
	</thead>
	<tbody id='list'>
		<c:forEach var="vo" items="${goodsList }">
			<tr>
				<td><a href="getGoods.do?gcode=${vo.goodsCode}">${vo.goodsCode }</a></td>
				<td>${vo.goodsName }</td>
				<td>${vo.company }</td>
				<td>${vo.price }</td>
				<td>${vo.category }</td>
				<td>${vo.thumbImage }</td>
				<td>${vo.detailImage }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- <script>
	const url = "goodsListJson.do"
	fetch(url)
	.then(result => result.json())
	.then(result => {
		result.forEach(vo => {
			const good = `			<tr>
				<td><a href="getGoods.do?gcode=\${vo.goodsCode}">\${vo.goodsCode }</td>
				<td>\${vo.goodsName }</td>
				<td>\${vo.company }</td>
				<td>\${vo.price }</td>
				<td>\${vo.category }</td>
				<td><img src="images/\${vo.thumbImage }"></td>
				<td><img src="images/\${vo.detailImage }"></td>
			</tr>`
			list.insertAdjacentHTML('beforeend', good);
		})
	})
</script> -->