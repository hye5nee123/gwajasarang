<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewListAjax.jsp</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	console.log('${goodsCode}');
	showReviewList('${goodsCode}');
</script>
<body>
	<div class="product__details__tab__desc">
		<div class="reviewList">
			<h3>상품평 목록</h3>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>제목</th>
						<th>별점</th>
						<th>작성자</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>