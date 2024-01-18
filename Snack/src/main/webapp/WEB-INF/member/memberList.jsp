<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
</style>

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
        <div class="checkout__form">
            <h4>회원정보</h4>
            <table class="table">
				<tbody>	
					<tr>
						<th>아이디</th>	
						<td>${vo.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${vo.pw}</td>
					</tr>	
					<tr>
						<th>이름</th>
						<td>${vo.memberName}</td>
					</tr>
					<tr>	
						<th>연락처</th>
						<td>${vo.memberPhone}</td>
					</tr>
					<tr>	
						<th>주소</th>
						<td>${vo.memberAddress}</td>
					</tr>
					<tr>	
						<th>이메일</th>
						<td>${vo.email}</td>
					</tr>
				</tbody>
			</table>
        </div>
    </div>
</section>

<script>
</script>
