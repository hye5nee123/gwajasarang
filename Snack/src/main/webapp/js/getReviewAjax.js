/**
 * getReviewAjax.js
 */
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