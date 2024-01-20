<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewListAjax.jsp</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<body>
	<div id="reviewList"></div>
	<script>
		const goodsCode = `${goodsCode}`;
		const logCode = `${logCode}`;
		const logId = `${logId}`;
	</script>
	<script type="text/javascript" src="js/reviewListAjax.js"></script>
	<script>
		showList();	
	</script>
</body>
</html>