/**
 * reviewListAjax.js
 */
function showReviewList(goodsCode) {
	fetch('reviewListJson.do?goodsCode=' + goodsCode)
		.then(result => result.json())
		.then(result => {
			console.log(result);

			result.forEach(item => {
				console.log(item);
				let tr = $('<tr />').append($('<td  class="title"/>').text(item.title),
					$('<td  class="stars"/>').text(item.stars),
					$('<td  class="memberCode"/>').text(item.memberCode),
					$('<td  class="reviewCode"/>').text(item.reviewCode)
				);
				$('#list').append(tr);
				$('.title').bind('click', function() {
					window.location.href = "getReviewAjax.do?reviewCode=" + item.reviewCode;
				})
			});

			let button = $('<input type="button" value="리뷰 등록" onclick="addFunc(`${goodsCode}`)"/>');
			$('.reviewList').append(button);

		})
		.catch(err => {
			console.error(err)
		})

}