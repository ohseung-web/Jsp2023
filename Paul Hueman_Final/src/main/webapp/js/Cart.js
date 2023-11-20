var item = document.getElementsByClassName("ul_of_cart");
var check = document.getElementsByName("checkbox_cart");
var price = document.getElementsByName("price");
var cnt = document.getElementsByName("cnt");
var sum = document.getElementsByClassName("li_price");
var con = document.getElementById("selcart");

/* 화면 출력 함수 */
function setPage(){
    var total = 0;
    for(var i = 0; i < item.length; i++){
        var sumvalue = (parseInt(price[i].value) * parseInt(cnt[i].value));
		if(isNaN(sumvalue)) sum[i].innerHTML = 0; 
        else {
			sum[i].innerHTML = sumvalue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	total += sumvalue;
		}
    }
    document.getElementById("total_number").innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 숫자 외 입력 방지 함수 */
function cntInput(){
    var reg = /^(?:[1-9]{1}[0-9]{0,3})$/;
	var val = event.target.value;
	if(val != "" && !reg.test(val)){
		val = val.slice(0, val.length - 1);
	}
	event.target.value = val;
	setPage();
}

/* 수량 감소 함수 */
function cntDown(idx){
	if(parseInt(cnt[idx].value) > 1){
		cnt[idx].value = parseInt(cnt[idx].value) - 1;
		setPage();
	} else {
		window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.")
	}
}

/* 수량 증가 함수 */
function cntUp(idx){
	if(parseInt(cnt[idx].value) < 9999){
		cnt[idx].value = parseInt(cnt[idx].value) + 1;
		setPage();
	} else {
		window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.")
	}
}

/* 한 개 품목 수정 함수 */
function updateCart(idx){
	if(cnt[idx].value > 0 && cnt[idx].value <= 9999){
		$.ajax({
			url : "updateCart.do",
			type : "post",
			datatype : "html",
			data : $(".itemform").eq(idx).serialize(),
			success : function(data){
				location.reload();
			}
		})
	} else {
		window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.");
	}
}

/* 한 개 품목 삭제 함수 */
function deleteCart(idx){
	$.ajax({
		url : "deleteCart.do",
		type : "post",
		datatype : "html",
		data : $(".itemform").eq(idx).serialize(),
		success : function(data){
			location.reload();
		}
	})
}

/* 선택 삭제 함수 */
function deleteItem(){
	var cnt = 0;
    for(var i = 0; i < check.length; i++){
        if(check[i].checked) {
            var hid = document.createElement("input");
            hid.setAttribute("type", "hidden");
            hid.setAttribute("name", "item");
            hid.setAttribute("value", check[i].value);
            con.appendChild(hid);
            cnt++;
        }
    }
    if(cnt > 0){
    	$.ajax({
    		url : "CartSelectDel.do",
    		type : "post",
    		datatype : "html",
    		data : $("#selcart").serialize(),
    		success : function(data){
    			$("body").append(data);
    			location.reload();
    		}
    	})
    }
}

/* 전체 삭제 함수 */
function deleteAll(){
    for(var i = 0; i <check.length; i++){
        check[i].checked = true;
    }
    deleteItem();
}

/* 주문목록 호출 함수 */
function getOrder(){
	var order = document.getElementById("cart_order");
    for(var i = 0; i < check.length; i++){
        if(check[i].checked) {
            var hid = document.createElement("input");
            hid.setAttribute("type", "hidden");
            hid.setAttribute("name", "item");
            hid.setAttribute("value", check[i].value);
            order.appendChild(hid);
        }
    }
    order.submit();
}

/* 돌아가기 함수 */
function back(){location.href = "Main.jsp";}
