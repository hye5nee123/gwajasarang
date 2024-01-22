/**
 * reviewListAjax.js
 **/
console.log(goodsCode);
console.log(logId);
console.log(logCode);
let pageInfo = 1;

function pageList(e) { // 이벤트를 인수로 받음
		// a 태그 클릭해도 페이지 이동 안하고 계속 머물러 있게 하기
		// preventDefault(): a 태그의 기본 기능(링크 페이지로 보내기) => 차단
		e.preventDefault();
		// a 태그 클릭하면 이동하는 페이지
		pageInfo = this.getAttribute("href"); // this: 이벤트를 받는 대상 = a
		console.log(pageInfo);

		// Ajax 호출.
		document.querySelector('#reviewList').innerHTML = '';
		showList(pageInfo);
		// 페이지를 생성하는 함수 호출
		
		document.querySelector('#paging').innerHTML = '';
		pagingList(pageInfo);
		
}

// 상품평목록 생성 함수
function showList(page = 1) {
	fetch('reviewListJson.do?goodsCode=' + goodsCode + "&page=" + page)
		.then(result => result.json())
		.then(result => {

			// 테이블 생성
			makeListTable();
			// tr 생성
			result.forEach(item => {
				makeTr(item);
			});

			// 페이징 링크 생성
			pagingList(page);
			// 클릭 이벤트 부여
			$('#list>tr').on('click', function(e) {
				let reviewCode = e.target.parentNode.firstChild.innerText;
				// 상품평 상세테이블 생성
				document.querySelector('#reviewList').innerHTML = '';
				makeReviewTable()
				showDetail(reviewCode)
			});

		})
		.catch(err => {
			console.error(err)
		})
}

// 상품평 목록 테이블 생성 함수
function makeListTable() {
	let table = `<div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>상품평</h2>
                    </div>
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>별점</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody id="list">
						</tbody>
					</table>
					<div id="paging" class="col-lg-12 product__pagination" align="center"></div>
					<div class="col-lg-12" align="right">
              			<input type="button" class="site-btn addBtn" value="상품평 등록"/>
              		</div>
				</div>`;
	document.querySelector('#reviewList').insertAdjacentHTML("beforeend", table);
	$('thead tr').css('backgroundColor', '#7FAD39').css('color', 'white');
	$('addBtn').css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		'marginRight': '5px'
	});
	$('.addBtn').hover(function() {
		$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
	}, function() {
		$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
	});

	$('.addBtn').on('click', function() {
		if (confirm('리뷰 등록을 위해 주문정보 페이지로 이동합니다.')) {
			location.href = 'ordersList.do?memberCode=' + logCode;
		}
	})
}

// tr 생성 함수
function makeTr(item) {
	let span = $('<span />');
	for (i = 0; i < item.stars; i++) {
		span.append($('<i class="fa fa-star" />'))
	}
	
	strDate = item.reviewDate.split(' ')[0];
	
	let tr1 =
		$('<tr />').append(
			$('<td class="reviewCode" />').text(item.reviewCode).attr('style', "display:none;"),
			$('<td class="rn" />').text(item.rn),
			$('<td class="title"/>').text(item.title),
			$('<td class="memberName"/>').text(item.memberName),
			$('<td class="stars1" />').append(span),
			$('<td class="reviewDate"/>').text(strDate),
		);

	$('#list').append(tr1);
	$('#list tr').hover(function() {
		$(this).css('backgroundColor', '#eee');
	}, function() {
		$(this).css('background', 'none');
	});
}

// 페이징 링크 생성
function pagingList(page) {
	let paging = document.querySelector('#paging');
	paging.innerHTML = '';
	fetch('ReviewPagingJson.do?goodsCode=' + goodsCode + '&page=' + page)
		.then(result => result.json())
		.then(result => {
			console.log(result);
			let paging = document.querySelector('#paging');
			// 이전 페이지 링크 출력
			if (result.prev) {
				let aTag = document.createElement('a');
				aTag.href = result.startPage - 1;
				aTag.innerHTML = '<i class="fa fa-long-arrow-left"></i>';
				aTag.addEventListener('click', pageList);
				paging.appendChild(aTag);
			}
			// 페이징 목록 출력
			for (let p = result.startPage; p <= result.lastPage; p++) {
				let aTag = document.createElement('a');
				if (p == page) {
					aTag.setAttribute('class', 'active');
				}

				aTag.href = p;
				aTag.innerText = p;
				// a 태그 클릭시 페이지 보여주는 함수(콜백 함수: 나중에 이벤트 실행되면 실행됨)
				aTag.addEventListener('click', pageList);
				paging.appendChild(aTag);
			}
			// 이후 페이지 링크 출력
			if (result.next) {
				let aTag = document.createElement('a');
				aTag.href = result.lastPage + 1;
				aTag.innerHTML = '<i class="fa fa-long-arrow-right"></i>';
				aTag.addEventListener('click', pageList);
				paging.appendChild(aTag);
			}
		})
		.catch(err => {
			console.error(err)
		})
}

// 상품평 상세 테이블 생성 함수
function makeReviewTable() {
	let table = `<div class="col-lg-12" id="detailReview">
					<div class="section-title related-blog-title">
                        <h2>상품평 상세보기</h2>
                    </div>
					<table class="table">
					<tr>
						<th>상품 코드</th>
						<td class="goodsCode"></td>
					</tr>
					<tr>
						<th>상품평 코드</th>
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
						<td class="stars2"></td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td class="reviewDate"></td>
					</tr>
				</table>
				</div>
				<div class="col-lg-12" id="reviewBtns" align="right">`
	document.querySelector('#reviewList').insertAdjacentHTML("beforeend", table);
	$('#detailReview th').css({
		background: '#7FAD39',
		color: 'white',
		'text-align': 'center',
		width: '200px'
	})
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
			for (i = 0; i < result.stars; i++) {
				$('.stars2').append($('<i class="fa fa-star" />'))
			}
			$('.reviewDate').text(result.reviewDate);

			// 목록으로 버튼
			let listBtn = $('<input type ="button" class="site-btn" id="goToList" value="목록으로"/>');
			listBtn.css({
				'backgroundColor': '#f5f5f5',
				'color': '#6f6f6f',
				'marginRight': '5px'
			});
			listBtn.hover(function() {
				$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
			}, function() {
				$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
			});
			$('#reviewBtns').append(listBtn);

			listBtn.on('click', function() {
				document.querySelector('#reviewList').innerHTML = '';
				showList();
			})


			// 상품평 수정 버튼
			let modBtn = $('<input type ="button" class="site-btn" id="modBtn" value="수정"/>');
			modBtn.css({
				'backgroundColor': '#f5f5f5',
				'color': '#6f6f6f',
				'marginRight': '5px'
			});
			modBtn.hover(function() {
				$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
			}, function() {
				$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
			});
			$('#reviewBtns').append(modBtn);

			// 상품평 수정버튼 클릭 이벤트
			modBtn.on('click', function() {
				if (logCode == '') {
					alert('로그인 후 수정 가능합니다.');
				}
				else if (logCode != result.memberCode) {
					alert('상품평 수정 권한이 없습니다.');
				}
				else if (logCode == result.memberCode) {
					if (confirm("상품평을 수정하시겠습니까?")) {
						modReviewForm(result);
					}
				}
			});

			// 상품평 삭제 버튼
			let delBtn = $('<input type ="button" class="site-btn" id="delBtn" value="삭제"/>');
			delBtn.css({
				'backgroundColor': '#f5f5f5',
				'color': '#6f6f6f',
			});
			delBtn.hover(function() {
				$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
			}, function() {
				$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
			});
			$('#reviewBtns').append(delBtn);

			// 상품평 삭제버튼 클릭 이벤트
			delBtn.on('click', function() {
				if (logCode == '') {
					alert('로그인 후 삭제 가능합니다.');
				}
				else if (logCode != result.memberCode) {
					alert('상품평 삭제 권한이 없습니다.');
				}
				else if (logCode == result.memberCode) {
					if (confirm("상품평을 삭제하시겠습니까?")) {
						
						remReviewFunc(result.reviewCode);
						document.querySelector('#reviewList').innerHTML = '';
						setTimeout(function() {
							
							showList();
						}, 1000);					
					}
				}
			});
		})
		.catch(err => {
			console.error(err)
		})
}

// 상품평 수정 화면 이동
function modReviewForm(result) {
	let table = `<div class="col-lg-12">
					<div class="section-title related-blog-title">
                        <h2>상품평 수정</h2>
                    </div>                    
					<input type="hidden" name="goodsCode" value="${result.goodsCode}"></td>
					<div class="checkout__input">
	                    <p>상품평 번호</p>
	                    <input type="text" name="reviewCode" value="${result.reviewCode}" readonly>
	                </div>
	                <div class="checkout__input">
	                    <p>제목</p>
	                    <input type="text" name="title" value="${result.title}">
	                </div>
	                <div class="checkout__input">
	                    <p>내용</p>
	                    <textarea style="width:100%" rows="4" name="content">${result.content}</textarea>
	                </div>
                </div>
                <div class="col-lg-2">
	                <div class="checkout__input">
	                    <p>별점</p>
	                    <input type="number" name="stars" value="${result.stars}" min="1" max="5" step="1">
	                </div>
                </div>
                <div class="checkout__input">
                    <input type="submit" class="site-btn modbutton" id="modCheck" value="저장">
					<input type="button" class="site-btn modbutton" id="modCancel" value="취소">
                </div>`
	document.querySelector('#reviewList').innerHTML = '';
	document.querySelector('#reviewList').insertAdjacentHTML("beforeend", table);
	$('.modbutton').css({
		'backgroundColor': '#f5f5f5',
		'color': '#6f6f6f',
		'marginRight': '5px'
	});
	$('.modbutton').hover(function() {
		$(this).css('backgroundColor', '#7FAD39').css('color', 'white');
	}, function() {
		$(this).css('background', '#f5f5f5').css('color', '#6f6f6f');
	});


	// 저장 버튼 클릭 이벤트 
	$('#modCheck').on('click', function() {
		let reviewCodeInput = $('input[name=reviewCode]').val();
		let titleInput = $('input[name=title]').val();
		let contentInput = $('textarea[name=content]').val();
		let starsInput = $('input[name=stars]').val();

		if (titleInput == '' || contentInput == '') {
			alert('상품평 제목과 내용을 입력해주세요')
		}
		else {
			modReviewFunc(reviewCodeInput, titleInput, contentInput, starsInput);
			document.querySelector('#reviewList').innerHTML = '';
			makeReviewTable();
			showDetail(result.reviewCode);
		}
	})

	// 취소 버튼 클릭 이벤트 
	$('#modCancel').on('click', function() {
		document.querySelector('#reviewList').innerHTML = '';
		makeReviewTable()
		showDetail(result.reviewCode)
	})
}

// 상품평 수정 기능
async function modReviewFunc(reviewCode, title, content, stars) {
	const promise = await fetch('modReviewJson.do', {
		method: 'post',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'reviewCode=' + reviewCode + '&title=' + title + '&content=' + content + '&stars=' + stars
	});
	const json = await promise.json();
	try {
		if (json.retCode == 'OK') {
			alert('상품평 수정이 완료되었습니다.');
		} else if (json.retCode == 'NG') {
			alert('처리중 에러');
		}
	} catch (err) {
		console.error('예외=> ', err);
	}
}

// 상품평 삭제 기능
async function remReviewFunc(reviewCode) {
	const promise = await fetch('remReviewJson.do', {
		method: 'post',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'reviewCode=' + reviewCode
	});
	const json = await promise.json();
	try {
		if (json.retCode == 'OK') {
			alert('상품평 삭제가 완료되었습니다.');			
			document.querySelector('#reviewList').innerHTML = '';

		} else if (json.retCode == 'NG') {
			alert('처리중 에러');
		}
	} catch (err) {
		console.error('예외=> ', err);
	}
}