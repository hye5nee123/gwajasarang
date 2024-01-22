/**
 * like.js
 */

// 좋아요 추가
$('.btn_like').on('click', function () {
    event.preventDefault();

    let memberCode = $(this).data('membercode');
    let goodsCode = $(this).data('goodscode');

    if (memberCode == '') {
        alert('로그인이 필요합니다');
    }
	else{
	    fetch('addLike.do', {
	        method: 'post',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        body: '&memberCode=' + memberCode + '&goodsCode=' + goodsCode
	    })
	        .then(result => result.json())
	        .then(result => {
	            console.log(result);
	            if (result.retCode == 'OK') {
	                alert('찜목록에 추가했습니다');
	            } else if (result.retCode == 'NG') {
	                alert('찜목록에 상품이 이미 있습니다');
	            }
	        });
    	}
});

// 좋아요 삭제
$(".icon_close").on('click', function() {
	let cartCode = $(this).data("cartcode");
	console.log(cartCode);
	fetch("removeCart.do?cartCode=" + cartCode)
	//응답 결과 받는 구문(controller)
	.then(result => result.json())
	.then(result => {
		if (result.retCode == "OK") {
			alert('삭제됨');
			// event.target.closest("tr").remove();
			location.reload();
		} else {
			alert('삭제 중 오류 발생')
		}
	})
})