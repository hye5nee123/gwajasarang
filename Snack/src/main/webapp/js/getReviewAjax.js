/**
 * getReviewAjax.js
 */

function makeTable() {
	const tableDiv = `<div class="product__details__tab__desc">
		<div class="reviewList">
			<h3>상품평 상세</h3>
			<br>
			<table class="reviewDetail">
					<tr>
						<th>상품코드</th>
						<td class="goodsCode"></td>
					</tr>
					<tr>
						<th>리뷰코드</th>
						<td class="reviewCode"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td class="memberCode"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="content"></td>
					</tr>
					<tr>
						<th>별점</th>
						<td class="stars"></td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td class="reviewDate"></td>
					</tr>
			</table>
		</div>
	</div>`;
	$('body').text(tableDiv);
}

makeTable();

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