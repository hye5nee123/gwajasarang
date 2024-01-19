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
<script type="text/javascript" src="js/getReviewAjax.js" defer></script>
<script type="text/javascript" src="js/reviewListAjax.js" defer></script>
<body>
<h1>${logId }</h1>
	<div id="reviewList">

	</div>
	<script>
		showList(`${goodsCode}`, `${logId}`);
	</script>
</body>
</html>