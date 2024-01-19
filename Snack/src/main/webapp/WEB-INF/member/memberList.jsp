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
	.member_table{margin-top:50px !important;}
	.member_table table{border-top:2px solid #7fad39;}
	.member_table table th p{margin-bottom:0; color:#1c1c1c; font-size:17px; font-weight:700;}
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
            <div class="member_table">
	            <table class="table">
	            	<colgroup>
	            		<col span="1" width="15%";>
	            	</colgroup>
					<tbody>	
						<tr>
							<th><p>아이디</p></th>	
							<td>${vo.id}</td>
						</tr>
						<tr>
							<th><p>이름</p></th>
							<td>${vo.memberName}</td>
						</tr>
						<tr>	
							<th><p>연락처</p></th>
							<td>${vo.memberPhone}</td>
						</tr>
						<tr>	
							<th><p>주소</p></th>
							<td>${vo.memberAddress}</td>
						</tr>
						<tr>	
							<th><p>이메일</p></th>
							<td>${vo.email}</td>
						</tr>
					</tbody>
				</table>
			</div>	
        </div>
    </div>
</section>

<script>
</script>
