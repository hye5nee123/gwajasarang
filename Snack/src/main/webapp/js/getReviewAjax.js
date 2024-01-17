/**
 * getReviewAjax.js
 */
function ShowDetailReview(reviewCode) {
	fetch('getReviewJson.do?reviewCode=' + reviewCode)
		.then(result => result.json())
		.then(result => {
			console.log(result)
			console.log(result.title);

			$('.title').innerHTML = result.title
			// $('.content').insertAdjacentHTML("beforeend", result.content)
			// $('.memberCode').insertAdjacentHTML("beforeend", result.memberCode)
			// $('.reviewCode').insertAdjacentHTML("beforeend", result.reviewCode)

		})
		.catch(err => {
			console.error(err)
		})

}