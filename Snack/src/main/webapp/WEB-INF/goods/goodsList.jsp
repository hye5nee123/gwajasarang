<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<body>
    <!-- 카테고리 Section Begin -->
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
                            <li><a href="goodsList.do?category=사탕/껌">사탕/껌</a></li>
                            <li><a href="goodsList.do?category=시리얼">시리얼</a></li>
                            <li><a href="goodsList.do?category=베이커리/잼">베이커리/잼</a></li>
                            <li><a href="goodsList.do?category=과자/간식세트">과자/간식세트</a></li>
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
    <!-- 카테고리 Section End -->

    <!-- 배너 Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="bootstrap/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Snack Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../Snack/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Category</h4>
                            <ul>
                            <li><a href="goodsList.do?category=과자">과자</a></li>
                            <li><a href="goodsList.do?category=비스킷/크래커">비스킷/크래커</a></li>
                            <li><a href="goodsList.do?category=쿠키/파이">쿠키/파이</a></li>
                            <li><a href="goodsList.do?category=유기농/전통과자">유기농/전통과자</a></li>
                            <li><a href="goodsList.do?category=초콜릿">초콜릿</a></li>
                            <li><a href="goodsList.do?category=젤리/캐러멜">젤리/캐러멜</a></li>
                            <li><a href="goodsList.do?category=사탕/껌">사탕/껌</a></li>
                            <li><a href="goodsList.do?category=시리얼">시리얼</a></li>
                            <li><a href="goodsList.do?category=베이커리/잼">베이커리/잼</a></li>
                            <li><a href="goodsList.do?category=과자/간식세트">과자/간식세트</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
	                <!-- 추천상품 시작 -->
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>추천상품</h2>
                        </div>
                        <div class="row">
                             <div class="product__discount__slider owl-carousel" id="list">
                             	<c:forEach var="vo" items="${recommendList }">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="images/${vo.thumbImage }" onclick="location.href='getGoods.do?gcode=${vo.goodsCode }'">
                                            <div class="product__discount__percent">추천</div>
                                            
                                            <ul class="product__item__pic__hover">
<!--                                                 <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="getGoods.do?gcode=${vo.goodsCode }">${vo.goodsName }</a></h5>
                                            <div class="product__item__price">${vo.price }원 <!-- <span>$36.00</span> --></div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- 추천상품 끝 -->
                    
                    <!-- 정렬순서 시작 -->
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <form method="GET" action="goodsList.do">
                                    <input type="hidden" name="category" value="${category }">
                                    <input type="hidden" name="page" value="1">
                                    <span>Sort By</span>
                                    <select id="sort" name="sort" onchange="this.form.submit()">
                                        <option value="">이름순</option>
                                        <option value="price">가격순<option>
                                    </select>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${total }</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
<!--                                     <span class="icon_ul"></span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 정렬순서 끝 -->
                    
                    <!-- 상품목록 시작 -->
                    <div class="row">
                    <c:forEach var="vo" items="${goodsList }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="images/${vo.thumbImage }" onclick="location.href='getGoods.do?gcode=${vo.goodsCode }'">
                                    <ul class="product__item__pic__hover">
<!--                                         <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="getGoods.do?gcode=${vo.goodsCode }">${vo.goodsName }</a></h6>
                                    <h5>${vo.price }원</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                    <!-- 상품목록 끝 -->
                    
                    <!-- 페이징 시작 -->
                    <div class="product__pagination">
	                   
		                  	<c:if test="${dto.prev }">
		                        <a href="goodsList.do?category=${category }&sort=${sort }&page=${dto.startPage - 1 }"><i class="fa fa-long-arrow-left"></i></a>
		                    </c:if>
		                     <c:forEach var="i" begin="${dto.startPage }" end="${dto.lastPage }">
		                        <a href="goodsList.do?category=${category }&sort=${sort }&page=${i }">${i }</a>
		                    </c:forEach>
		                     <c:if test="${dto.next }">
		                        <a href="goodsList.do?category=${category }&sort=${sort }&page=${dto.lastPage + 1 }"><i class="fa fa-long-arrow-right"></i></a>
		                    </c:if>
                    </div>
                    <!-- 페이징 끝 -->
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

	<script src="js/like.js"></script>
	<script>
	let input = document.getElementById('searchBox');
	
	// input 태그 엔터 이벤트 핸들러
	input.addEventListener("keydown", function(e) {
		if(e.keyCode === 13) {
			e.preventDefault();
			document.querySelector(".site-btn").click();
		}
	});
	
	
	// 검색 버튼 핸들러
	function searchFunc() {
		let keyword = document.getElementById('searchBox').value;
		window.location.href = "searchList.do?keyword=" + keyword;
	}
	
 	function sortFunc() {
		let sort = document.querySelector('#sort').value;
		console.log(sort);
		document.set
		//let sortValue = sort.options[sort.selectedIndex].value;
	}
	
	let sort = document.querySelector('#sort');
	sort.addEventListener("change", function(e) {
		console.log("onchange select", e.target.value);
	});
		
		
		
		
		
	//recommendList(`${category }`)
	/* function recommendList(category) {
		fetch('goodsListJson.do?category='+category)
			.then(result => result.json())
			.then(result => {
				console.log(result)
				result.forEach(item => {
					makeList(item);
					//console.log(item);
					
					
				})
			})
		
	}
	
	function makeList(item) {
		console.log(item)

            let list = `
            	<div class="col-lg-4">
                <div class="product__discount__item">
                <div class="product__discount__item__pic set-bg"
                    data-setbg="images/\${item.thumbImage }" onclick="location.href='getGoods.do?gcode=\${item.goodsCode }'">
                    <div class="product__discount__percent">추천</div>
                    
                    <ul class="product__item__pic__hover">
                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                    </ul>
                </div>
                <div class="product__discount__item__text">
                    <span>Dried Fruit</span>
                    <h5><a href="getGoods.do?gcode=\${item.goodsCode }">\${item.goodsName }</a></h5>
                    <div class="product__item__price">\${item.price }원 <!-- <span>$36.00</span> --></div>
                </div>
            </div>
            </div>
            `
    
    document.querySelector('#list').insertAdjacentHTML("beforeend", list);
	} */
	
	</script>

</body>

</html>