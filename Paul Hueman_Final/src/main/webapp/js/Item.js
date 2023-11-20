/* 변수 설정 */
var price; // 개당 가격
var cate; // 카테고리
var cnt = document.getElementById("item_cnt"); // 구매 개수(input)
var total = document.getElementById("item_total"); // 총금액(span)
var log = 0;

/* 총금액 표시 함수 */
function getTotal(){
	if(isNaN(parseInt(cnt.value))) total.innerHTML = 0;
	else total.innerHTML = (price * parseInt(cnt.value)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 숫자 외 입력 방지 함수 */
function cntInput(){
    var reg = /^(?:[1-9]{1}[0-9]{0,3})$/;
	var val = event.target.value;
	if(val != "" && !reg.test(val)){
		val = val.slice(0, val.length - 1);
	}
	event.target.value = val;
	getTotal();
}

/* 화면 로딩 함수 */
function setPage(){
	if(cate == 2) document.querySelector(".section nav dd:first-of-type>a").style.borderBottomColor = "#aaaaaa";
	else if(cate == 1) document.querySelector(".section nav dd:last-of-type>a").style.borderBottomColor = "#aaaaaa";
	getTotal();
	var j = document.createElement("script");
	j.setAttribute("type", "text/javascript");
	j.setAttribute("src", "https://code.jquery.com/jquery-1.12.4.min.js");
	document.getElementsByTagName("head")[0].appendChild(j);
}

/* 수량 감소 함수 */
function cntDown(){
	if(parseInt(cnt.value) > 1){
		cnt.value = parseInt(cnt.value) - 1;
		getTotal();
	} else {
		window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.")
	}
}

/* 수량 증가 함수 */
function cntUp(){
	if(parseInt(cnt.value) < 9999){
		cnt.value = parseInt(cnt.value) + 1;
		getTotal();
	} else {
		window.alert("수량은 1에서 9999 사이의 값으로 입력해 주십시오.")
	}
}

/* 장바구니 담기 함수 */
function addCart(){
	if(log == 1){
		$.ajax({
			url : "AddCart.do",
			type : "post",
			datatype : "html",
			data : $("form").serialize(),
			success : function(data){
				$("body").append(data);
			}
		});
	} else {
		if(window.confirm("로그인이 필요합니다.\n지금 로그인 하시겠습니까?")) location.href = "Main.jsp?section=Login.jsp";
	}
}

/* 바로구매 함수 */
function buyNow(){
	if(log == 1){
		document.getElementsByTagName("form")[0].submit();
	} else {
		if(window.confirm("로그인이 필요합니다.\n지금 로그인 하시겠습니까?")) location.href = "Main.jsp?section=Login.jsp";
	}
}
