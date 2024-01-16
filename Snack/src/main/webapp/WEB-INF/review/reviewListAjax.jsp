<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<@ <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberListAjax.jsp</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/reviewList.js"></script>
<body>
	<div class="container">
		<h3>상품평</h3>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>별점</th>
					<th>리뷰일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="button" value="리뷰 등록"
						onclick="addFunc(`${goodsCode}`)"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		function addFunc(goodsCode) {
			window.location.href = "addReviewForm.do?goodsCode=" + goodsCode
		}
		
		fetch('reviewListJson.do', {
            method: 'post',
            mode: 'cors',
            headers: {
                'Content-Type': 'appliction/x-www-form-urlencoded'
            },
            //body: 'x=36&y=128'
        })    // url, option 객체
        // 정상 실행시
        .then(result => {
            console.log(result);
            return result.json(); // Json 문자열 => JS 객체로 변환
        })
        .then(json => {
            console.log(json);
        })
        // 에러시
        .catch(error => {
            console.error(error);
        })
	</script>
</body>
</html>