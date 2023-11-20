var item = document.getElementsByClassName("ul_of_order");
var price = document.getElementsByName("price");
var cnt = document.getElementsByName("cnt");
var sum = document.getElementsByClassName("li_price");
var name = "";
var zip = "";
var ra = "";
var da = "";
var ea = "";
var tel = "";

/* 화면 구성 함수 */
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
	document.getElementsByName("total")[0].value = total;
	document.getElementsByClassName("total_number")[0].innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementsByClassName("payment_number")[0].innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 회원정보 가져오기 함수 */
function setUserinfo(){
	if(document.getElementById("usercheck").checked){
		document.getElementById("order_name").value = name;
		document.getElementById("order_zipcode").value = zip;
		document.getElementById("order_roadAddr").value = ra;
		document.getElementById("order_detailAddr").value = da;
		document.getElementById("order_extraAddr").value = ea;
		document.getElementById("order_tel").value = tel;
	}
}

/* 주소 검색 함수 */
function getAddress(){
	new daum.Postcode({
		oncomplete: function(data) {
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			var extraRoadAddr = ''; // 참고 항목 변수
			// 법정동명이 있을 경우 추가한다.(법정리는 제외) 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만들어 입력란에 값을 삽입한다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
				document.getElementById("order_extraAddr").value = extraRoadAddr;
			}
	        document.getElementById("order_zipcode").value = data.zonecode;
	        document.getElementById("order_roadAddr").value = roadAddr;
	        document.getElementById("order_detailAddr").focus();
		}
	}).open();
}

/* 우편번호 입력 함수(숫자외 입력 방지) */
function chkNum(){
    var reg = /^\d{0,6}$/;
	var val = event.target.value;
	if(val != "" && !reg.test(val)){
		val = val.slice(0, val.length - 1);
	}
	event.target.value = val;
	setPage();
}

/* 구매 실행 함수 */
function order(){
	$.ajax({
		url : "Order.do",
		type : "post",
		datatype : "html",
		data : $("#order").serialize(),
		success : function(){
			window.alert("구매 완료되었습니다.");
			location.href = "Buy.do";
		}
	})
}

