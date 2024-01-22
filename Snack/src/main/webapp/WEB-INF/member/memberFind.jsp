<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	body{position:relative;}
	.button_box{margin:0 auto !important; text-align:center;}
	em.warning{font-style:normal; margin-top:15px; color:red; font-size:14px;}
	div.row{justify-content:space-between; margin:0;}
	#id{flex:0 0 83%;}
	#id_check{flex:0 0 15%; padding:0 15px; font-size:14px; color:#fff; background:#6f6f6f; border:0;}
	#find_popup{position:fixed; top:0; left:0; width:100%; height:100%; z-index:100;}
	#find_popup:before{content:''; display:block; position:fixed; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);}
	#find_popup p{text-align:center;}
	#find_popup p em{font-style:normal; color:#7fad39; font-weight:700;}
	#find_popup.show{display:block !important;}
	#find_popup .find_box{position:absolute; left:50%; top:50%; transform:translate(-50%, -50%); width:600px; height:300px; padding:30px; background:#fff; border-radius:20px; box-sizing:border-box;}
	#find_popup .close{position:absolute; right:50px; top:28px;}
	#find_popup #result_btn{display:block; margin:50px auto 0; padding:13px 30px 12px; border-radius:.3rem; color:#fff; border:0; background:#6f6f6f;}
	
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

<div id="find_popup" style="display:none;">
      	<section class="checkout spad find_box">
  			<div class="container">
			<div class="checkout__form">
           		<h4>아이디 찾기</h4>
           		<button type="button" class="close">x</button>
           		<p></p>
           		<button type="button" id="result_btn"></button>
           	</div>
         </div>
    </section>
</div>

<section class="checkout spad find_section">
    <div class="container">
        <div class="checkout__form">
            <h4>아이디 찾기</h4>
            <form name="findId" method="post" action="#find_popup">
            	<input type="hidden" name="checked_id" value="" />
	            <div class="checkout__input">
	                <p>이름<span>*</span></p>
	                <input type="text" id="name" name="name">
	                <em></em>
	            </div>
	            <div class="checkout__input">
	                <p>연락처<span>*</span></p>
	                <input type="text" id="phone" name="phone">
	                <em></em>
	            </div>
	            <div  class="button_box">            
		            <button type="button" id="findBtn" class="site-btn btn-lg">찾기</button>
	            </div>
            </form>
        </div>
    </div>
</section>


<script>
$("input").on('blur', emptyCheck)

function emptyCheck(){
	if(event.target.id == "email"){
		return;
	}
	if(event.target.value == ''){
		$(this).parents('.checkout__input').find('em').html("필수입력값입니다.").addClass('warning');
		event.target.focus();
	} else{
		$(this).parents('.checkout__input').find('em').html("");
	}
}

$("#findBtn").on('click', function() {
	$('#find_popup').addClass('show');
	findId();
})

$('.close').on('click', function() {
	$('#find_popup').removeClass('show');
})

function findId(){
	const name = $('#name').val()
	const phone = $('#phone').val()
	// const id_ok = true;
	fetch('memberFindJson.do?name=' + name + '&phone=' + phone, { 
		method: 'post',
		headers: {'Content-Type': "application/json"},
	}) 
	.then(result => result.json())
    .then(result => {
		console.log(result);	    	
	 /*    $(result).each((idx, res) => {
	    	if($("#id").val() == res.id){
	    		id_ok = false;
	    	}
			console.log(res);
	    }) */
    	if(result == null){
	    	$("#find_popup").find('p').html("찾는 아이디가 없습니다.").addClass('warning');
	    	$("#result_btn").text("다시검색").addClass("close_popup");
	    	$(".close_popup").on('click', function() {
	    		$("#find_popup").removeClass();
	    		$(".checkout__input input").val(""); 
	    		$(".checkout__input #name").focus(); 
	    	})
	    } else {
	    	$("#find_popup").find('p').html("찾으시는 아이디는 " + "<em>" + result + "</em>" + " 입니다.").addClass('warning');	
	    	$("#result_btn").text("로그인하러가기").attr("onclick", "loginGoFun()");
	    }
	   
    })
    .catch(err => console.log(err));
}

function loginGoFun(){
	document.forms.findId.action = "loginForm.do";
	document.forms.findId.submit();
}
</script>