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
		<%-- <c:forEach var="vo" items="${goodsList }">
			<tr>
				<td><a href="getGoods.do?gcode=${vo.goodsCode}">${vo.goodsCode }</td>
				<td>${vo.goodsName }</td>
				<td>${vo.company }</td>
				<td>${vo.price }</td>
				<td>${vo.category }</td>
				<td>${vo.thumbImage }</td>
				<td>${vo.detailImage }</td>
			</tr>
		</c:forEach> --%>	
	</tbody>
</table>
<script>
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
</script>