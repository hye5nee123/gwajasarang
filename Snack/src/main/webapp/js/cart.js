/**
 * cart.js
 */
$(document).ready(cartList());

//카트 전체 목록 보기
function cartList() {
    fetch("cartListJson.do?memberCode=M-00001", {
        method: "post",
        headers: { "Content-Type": "application/json" }
    })
        .then(res => res.json())
        .then(res => {
            console.log(res);
            $(res).each((idx, cart) => {
                let tr = `      <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-1.jpg" alt="">
                                        <h5>${cart.goodsName}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${cart.price}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                        <div class="pro-qty">
                                                <span class="dec qtybtn">-</span>
                                                <input type="text" value=1 class="que">
                                                <span class="inc qtybtn" >+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total " >
                                    ${cart.price * cart.quantity}
                                    <td><button id="updateBtn">수정</td>
                                    </td>
                                    <td class="shoping__cart__item__close" id="delCart"">
                                        <span class="icon_close" data-cartCode="${cart.cartCode}"></span>
                                        </td>
                                        </tr>`
                let cartListTbody = document.querySelector('#cartListTbody');
                cartListTbody.insertAdjacentHTML('afterend', tr);
                console.log('카트번호 : ' + `${cart.cartCode}`);
                console.log('수량 : ' + $('.que').val());
                
            })//end of foreach
            const totalList = document.querySelectorAll(".shoping__cart__total");
            let cartPrice = 0;
            totalList.forEach(ele => {
                cartPrice = cartPrice + parseInt(ele.innerHTML);
            })
            document.querySelector('#total').innerHTML = cartPrice;

            //플러스 버튼 작동 fun().
            $(".inc").on('click', function () {
                //console.log(event.target.nextElementSibling);
                let result = event.target.previousElementSibling.value;
                event.target.previousElementSibling.value = parseInt(result) + 1;
                let pbtnresult = parseInt(result) + 1;

                let onePrice = $(this).closest("td").prev().text();
                $(this).closest("td").next().text(pbtnresult * onePrice);
                console.log(pbtnresult * onePrice);
                
                const totalList = document.querySelectorAll(".shoping__cart__total");
                console.log(totalList[0].innerHTML);
                let cartPrice = 0;
                totalList.forEach(ele => {
                    cartPrice = cartPrice + parseInt(ele.innerHTML);
                })
                document.querySelector('#total').innerHTML = cartPrice;
                                //sevent.target.previousElementSibling.value(++$(cart.quantity));
            }) //end of plusBtn

            //아이템 삭제.
            $(".icon_close").on('click', function () {
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
            //end of 아이템 삭제.
            
            //수량 수정.
            $(".updateBtn").on("click",function(){
                
            })

            //마이너스 버튼 작동 fun().
            $(".dec").on('click', function () {
                //console.log(event.target.nextElementSibling.value);
                let result = event.target.nextElementSibling.value;
                if (result > 0) {
                    event.target.nextElementSibling.value = parseInt(result) - 1;
                } else {
                    return 0;
                }
                console.log(parseInt(result) - 1);
                let mbtnresult = parseInt(result) - 1;

                let onePrice = $(this).closest("td").prev().text();
                $(this).closest("td").next().text(mbtnresult * onePrice);

                console.log(mbtnresult * onePrice);
                const totalList = document.querySelectorAll(".shoping__cart__total");
                console.log(totalList[0].innerHTML);
                let cartPrice = 0;
                totalList.forEach(ele => {
                    cartPrice = cartPrice + parseInt(ele.innerHTML);
                })
                document.querySelector('#total').innerHTML = cartPrice;
                //event.target.nextElementSibling.value;

            }) //end of minusBtn

            //total 가격 출력.
            $('.total').on('click',function(){

            })

        }) //end of .then(res =>).
        .catch(console.error);
};//end of cartList();
