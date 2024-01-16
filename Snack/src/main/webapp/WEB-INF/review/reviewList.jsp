<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<h3>상품평</h3><br>
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<th>별점</th>
				<th>리뷰일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${reviewList}">
				<tr>
					<td><a href="getReview.do?reviewCode=${vo.reviewCode}">${vo.title}</a>
					</td>
					<td>${vo.stars}</td>
					<td>${vo.reviewDate}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="3" align="center">
				<input type="button" value="리뷰 등록"  onclick="addFunc('${vo.goodsCode}')">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</div>
<script>
	function addFunc(goodsCode){
		window.location.href = "addReviewForm.do?goodsCode=" + goodsCode
	}	
	
</script>