<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원로그인</h3>
	<p>가입하신 아이디와 비밀번호를 입력해주세요.</p>
	<form>
		<table class="table">
			<tr>
				<label for="m_id">아이디</label>
				<input type="text" name="m_id" id="m_id">
			</tr>
			<tr>
				<label for="m_pw">비밀번호</label>
				<iput type="password" name="m_pw" id="m_pw">
			</tr>
			<tr>
				<button class="btn">로그인</button>
			</tr>
		</table>
	</form>
</body>
</html>