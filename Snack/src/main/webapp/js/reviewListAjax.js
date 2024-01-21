/**
 * reviewListAjax.js
 */	
const reviewList = document.querySelector('#reviewList')
const goodsCode = reviewList.dataset.goodscode;
console.log('goodsCode=' + goodsCode);
showList(goodsCode);

function showList(goodsCode) {
	fetch('reviewListJson.do?goodsCode=' + goodsCode)
		.then(result => result.json())
		.then(result => {
			const listTable = makeListTable();
			document.querySelector('#reviewList').insertAdjacentHTML("beforeend", listTable);

			result.forEach(item => {
				console.log(item);
				let tr =
					$('<tr />').append(
						$('<td  class="title"/>').text(item.title),
						$('<td  class="memberCode"/>').text(item.memberCode),
						$('<td  class="stars"/>').text(item.stars),
						$('<td  class="reviewDate"/>').text(item.reviewDate)
					);
				$('#list').append(tr);
				$('.title').bind('click', function () {
					showDetailReview(item.reviewCode)
				})
			});

			let button = $('<input type="button" value="리뷰 등록" onclick="addFunc(`${goodsCode}`)"/>');
			$('.reviewList').append(button);

		})
		.catch(err => {
			console.error(err)
		})
}

function makeListTable() {
	const listTable = `<table class="table">
								<thead>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>별점</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody id="list">
								</tbody>
							</table>`;
	return listTable;
}

function showDetailReview(reviewCode) {
	fetch('getReviewJson.do?reviewCode=' + reviewCode)
		.then(result => result.json())
		.then(result => {
			console.log(result)
			console.log(result.title);

			$('.goodsCode').text(result.goodsCode)
			$('.reviewCode').text(result.reviewCode)
			$('.memberCode').text(result.memberCode)
			$('.title').text(result.title)
			$('.content').text(result.content)
			$('.stars').text(result.stars)
			$('.reviewDate').text(result.reviewDate)


		})
		.catch(err => {
			console.error(err)
		})

}