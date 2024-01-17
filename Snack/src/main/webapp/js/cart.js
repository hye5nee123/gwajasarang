/**
 * cart.js
 */
$(document).ready(cartList());




//카트 전체 목록 보기
function cartList() {
  fetch("cartListJson.do?memberCode=M-00001", {
    method: "get",
    headers: { "Content-Type": "application/json" },
  })
    .then((res) => res.json())
    .then((res) => {
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
                                                <input type="text" value=0 class="que">
                                                <span class="inc qtybtn" >+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                     
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                        
                                    </td>
                                </tr>`;
        let cartListTbody = document.querySelector("#cartListTbody");
        cartListTbody.insertAdjacentHTML("afterend", tr);
      }
      ); //end of foreach



      //마이너스 버튼.
      $(".dec").on("click", function () {
        console.log(event.target.nextElementSibling);
        let result = event.target.nextElementSibling.value;
        if (result > 0) {
          event.target.nextElementSibling.value = parseInt(result) - 1;
        } else {
          return 0;
        }
        event.target.nextElementSibling.value;
      }); //end of minusBtn

      //플러스 버튼.
      $(".inc").on("click", function () {
        //console.log(event.target.nextElementSibling);
        let result = event.target.previousElementSibling.value;
        event.target.previousElementSibling.value = parseInt(result) + 1;
        //sevent.target.previousElementSibling.value(++$(cart.quantity));
      }); //end of plusBtn

      //아이템 삭제.
      $(".icon_close").on("click", function () {
        console.log($(".icon_close"));
        event.target.closest("tr").remove();
      }); //end of 아이템 삭제.

      //로그인 체크(시도중)
      function onCart(){
        let goodsCode = $("goodsCode").val();
        let memberCode = $("memberCode").val();
        
        if(memberCode ==""){
          alert("로그인 후 이용 가능합니다.");
          location.href="http://localhost:7950/Snack/"
        }
      }//end of onCart()
    

      
    }) //end of click().
    .catch(console.error);
}

       
    

onCart();
cartList();
