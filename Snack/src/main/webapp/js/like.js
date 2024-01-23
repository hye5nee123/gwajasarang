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
$('.btn_close').on('click', function (){
	alert("삭제하시겠습니까?");
	let goodsCode = $('.btn_close').data('goodscode');
	let memberCode = $('.btn_close').data('membercode');
	console.log('goodsCode:' + goodsCode + ', ' + 'memberCode:' + memberCode);
	fetch("removeLike.do?memberCode=" + memberCode + '&goodsCode=' + goodsCode)
	.then(result => result.json())
	.then(result => {
		if (result.retCode == "OK") {
			alert('삭제완료');
			location.reload();
		} else {
			alert('삭제 중 오류 발생.');
		}
	})
})

// 전체선택 
$('.like_table thead').find('input').on('click', function() {
	$('.like_table tbody').find(':checkbox').prop('checked', this.checked);
});

// 전체삭제
/*$('#delBtn').on('click', async function() {
	if ($('input[type="checkbox"]:checked').length === 0) {
		alert('삭제할 항목을 선택해주세요.');
		return;
	}
	if (confirm('선택한 항목을 삭제하시겠습니까?')) {
		let deletePromises = [];
		$('input[type="checkbox"]:checked').forEach(checkedItem => {
			let deletePromise = fetch(`removeLike.do?goodsCode=${goodsCode}&memberCode=${memberCode}`, {
				method: 'GET'
			})
				.then(result => result.json())
				.then(result => {
					if (result.retCode !== 'OK') {
						console.error('삭제 중 오류 발생:', result.errorMessage);
					}
				})
				.catch(error => {
					console.error('삭제 중 오류 발생:', error);
				});
			deletePromises.push(deletePromise);
		});
		// 모든 삭제 작업이 완료될 때까지 기다림
		await Promise.all(deletePromises);
		// 화면에서 삭제
		checkedItems.forEach(checkedItem => {
			checkedItem.closest('tr').remove();
		});
		alert('삭제완료');
	}
});*/