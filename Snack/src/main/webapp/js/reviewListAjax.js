/**
 * reviewListAjax.js
 */
// 리뷰목록 생성 함수


function showList(goodsCode, logId) {
	fetch('reviewListJson.do?goodsCode=' + goodsCode)
		.then(result => result.json())
		.then(result => {

			// 테이블 생성
			makeListTable();

			// tr 생성
			result.forEach(item => {
				makeTr(item);
			});

			// 클릭 이벤트 부여
			$('#list>tr').on('click', function (e) {
				let reviewCode = e.target.parentNode.firstChild.innerText;
				// 리뷰 상세테이블 생성
				document.querySelector('#reviewList').innerHTML = '';
				makeReviewTable(goodsCode, logId)
				showDetail(reviewCode)
			});		

		})
		.catch(err => {
			console.error(err)
		})
}

// 리뷰 목록 테이블 생성 함수
function makeListTable() {
	let table = `<table class="table">
								<thead>
									<tr>
										<th>리뷰번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>별점</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody id="list">
								</tbody>
							</table>`;
	document.querySelector('#reviewList').insertAdjacentHTML("beforeend", table);
	$('thead tr').css('backgroundColor', '#7FAD39').css('color', 'white');
	
}

// tr 생성 함수
function makeTr(item) {
	let tr1 =
		$('<tr />').append(
			$('<td class="reviewCode" display="none" />').text(item.reviewCode),
			$('<td class="title"/>').text(item.title),
			$('<td class="memberName"/>').text(item.memberName),
			$('<td class="stars"/>').text(item.stars),
			$('<td class="reviewDate"/>').text(item.reviewDate),
		);
	$('#list').append(tr1);
	$('#list tr').hover(function () {
		$(this).css('backgroundColor','#eee');
	}, function() {
		$(this).css('background','none');
	});
	
}

// 리뷰 상세 테이블 생성 함수
function makeReviewTable(goodsCode, logId) {
	let table = `<table class="table" id="detailReview">
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
						<td class="memberName"></td>
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
				</table>`
	document.querySelector('#reviewList').insertAdjacentHTML("beforeend", table);
	$('#detailReview th').css({
		background: '#7FAD39',
		color: 'white',
		'text-align': 'center',
		width: '200px'
	})
	
	// 목록으로 버튼
	let listBtn = $('<input type ="button" class="site-btn" id="goToList" value="목록으로"/>');
	listBtn.css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		'marginRight': '5px'
		});
	listBtn.hover(function () {
		$(this).css('backgroundColor','#7FAD39').css('color', 'white');
	}, function() {
		$(this).css('background','#f5f5f5').css('color', '#6f6f6f');
	});
	listBtn.on('click', function(){
		document.querySelector('#reviewList').innerHTML = '';
		showList(goodsCode);
	})

	$('#reviewList').append(listBtn);
	
	// 리뷰 수정 버튼
	let addBtn = $('<input type ="button" class="site-btn" id="addBtn" value="리뷰수정"/>');
	addBtn.css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		'marginRight': '5px'
		});
	addBtn.hover(function () {
		$(this).css('backgroundColor','#7FAD39').css('color', 'white');
	}, function() {
		$(this).css('background','#f5f5f5').css('color', '#6f6f6f');
	});
	addBtn.on('click', function(){
		
	});
	$('#reviewList').append(addBtn);
	
	// 리뷰 삭제 버튼
	let delBtn = $('<input type ="button" class="site-btn" id="delBtn" value="리뷰삭제"/>');
	delBtn.css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		});
	delBtn.hover(function () {
		$(this).css('backgroundColor','#7FAD39').css('color', 'white');
	}, function() {
		$(this).css('background','#f5f5f5').css('color', '#6f6f6f');
	});
	delBtn.on('click', function(){
		
	});
	$('#reviewList').append(delBtn);
}

// 상세정보 출력 함수
function showDetail(reviewCode) {
	fetch('getReviewJson.do?reviewCode=' + reviewCode)
		.then(result => result.json())
		.then(result => {

			$('.goodsCode').text(result.goodsCode);
			$('.reviewCode').text(result.reviewCode);
			$('.memberName').text(result.memberName);
			$('.title').text(result.title);
			$('.content').text(result.content);
			for(i=0;i<result.stars;i++){
				$('.stars').append($('<i class="fa fa-star" />'))
			}
			$('.reviewDate').text(result.reviewDate);

		})
		.catch(err => {
			console.error(err)
		})
}