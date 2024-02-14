<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<script src="https://kit.fontawesome.com/82fd850f0d.js" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#header{
	position: relative;
	width: 898px;
	margin: 0 auto;
}
#header .header{
	position: relative;
	padding: 18px 0;
	font-size: 16px;
	font-weight: 400;
    letter-spacing: -0.4px;
	text-align: center;
    vertical-align: top;
    border-left: 1px solid #d7d5d5;
    border-right: 1px solid #d7d5d5;
    background: #fff;
}
#header .header h1{
	margin: 0 95px;
	text-align: center;
}
#header .header h1 a{
	font-size: 18px;
	font-weight: 700;
	color: #000;
}
#header .headerMenu {
    position: absolute;
    top: 50%;
    margin-top: -15px;
}
#header .headerMenu a{
	position: relative;
    overflow: hidden;
	display: inline-block;
	width: 30px;
    height: 30px;
    font-size: 1px;
    line-height: 0;
    color: transparent;
}
#header .headerMenu.gLeft{
	left: 0;
}
#header .headerMenu.gLeft a{
	margin-left: 10px;
}
#header .headerMenu .btnBack::before{
	content: "";
    position: absolute;
    top: 5px;
    left: 9px;
    width: 10px;
    height: 17px;
    background: url(img/icon/sfix_header.png) no-repeat 0 0;
    background-size: 90px auto;
}
#header .headerMenu.gRight{
	right: 0;
}
#header .headerMenu.gRight a{
	margin-right: 10px;
}
#header .headerMenu.gRight a .cartCount{
	overflow: hidden;
    position: absolute;
    right: 0;
    top: 2px;
    width: 14px;
    height: 14px;
    padding: 0 2px;
    border-radius: 14px;
    font-weight: 700;
    font-size: 9px;
    line-height: 13px;
    color: #fff;
    text-align: center;
    background: #ff0000;
}
#header .headerMenu .btnBasket{
	background: url(img/icon/sfix_header.png) no-repeat -30px 0;
    background-size: 90px auto;
}
#header .headerMenu .btnMyPage{
	background: url(img/icon/sfix_header.png) no-repeat -60px 0;
    background-size: 90px auto;
}
#header .titleArea h1{
	position: relative;
    padding: 0 42px;
    line-height: 61px;
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    border: 1px solid #D7D7D7;
	background-color: #111;
}
#order{
	overflow: hidden;
	width: 900px;
    margin: 0 auto;
    border-left: 1px solid #d7d5d5;
    border-right: 1px solid #d7d5d5;
    background: #EDEDED;
}
#order .title{
	position: relative;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	padding: 20px 16px;
    word-wrap: break-word;
    word-break: break-all;
	cursor: pointer;
}
#order .title h2{
	margin-right: 10px;
	font-size: 18px;
    font-weight: 600;
    line-height: 27px;
	color: #000;
}
#order .fold{
	position: relative;
    margin-top: 10px;
    padding: 0;
    border-bottom: 1px solid #d7d5d5;
    border-width: 1px 0;
    background: #fff;
}
#order .fold .title i{
	width: 20px;
    height: 20px;
    display: inline-block;
	font-size: 20px;
	vertical-align: center;
	color: #666;
	transition: transform 0.3s;
}
#order .fold.selected .title i{
	transform: rotate(180deg);
	transition: transform 0.3s;
}
#order .fold .contents{
	overflow: hidden;
    opacity: 0;
    height: 0;
    border-top-width: 0;
}
#order .fold.selected .contents{
	overflow: visible;
	opacity: 1;
    height: auto;
	transition: height .3s ease,opacity .3s ease-out;
}
#order .shippingInfo{
	padding: 0 16px 20px;
	line-height: 24px;
}
.tableBox{
    border-top: 2px solid #1a1a1a;
}
table{
    width: 100%;
    border: 0;
    border-collapse: collapse;
}
.tableBox table tr th, .tableBox table tr td{
    height: auto;
}
.tableBox table tr th{
    width: 190px;
    padding: 10px 15px;
    font-size: 14px;
    font-weight: 400;
    color: #1a1a1a;
    border-bottom: 1px solid #e5e5e5;
    background-color: #f6f6f6;
    line-height: 22px;
    vertical-align: middle;
}
.tableBox table tr th img{
    display: inline-block;
    width: 4px;
    height: 4px;
    vertical-align: middle;
}
.tableBox table tr td{
    width: auto;
    padding: 10px 20px;
    font-size: 14px;
    font-weight: 400;
    color: #1a1a1a;
    border-bottom: 1px solid #e5e5e5;
    line-height: 22px;
    vertical-align: middle;
}
.tableBox table tr td input[type="text"], .tableBox table tr td input[type="password"]{
    width: 410px;
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: #000;
    font-size: 13px;
    outline: 1px;
}
.tableBox table tr td input[type="text"]:focus, .tableBox table tr td input[type="password"]:focus,
.tableBox table tr td input[type="text"]:hover, .tableBox table tr td input[type="password"]:hover{
    border-color: #000;
    transition: 0.3s;
}
.tableBox table #pwq, .tableBox table #pwa{
    width: 450px;
}
#pwq, #phone1{
    max-width: 100%;
    height: 40px;
    padding: 0 30px 0 15px;
    font-size: 13px;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    background: url(img/icon/ico_select.png);
    background-repeat: no-repeat;
    background-position: right 10px center;
    /* background: #fff url(img/icon/ico_select.png) no-repeat right 10px center; */
    background-size: 14px 8px;
    appearance:none;
}
.tableBox table .formMultiple{
    padding-top: 22px;
    padding-bottom: 22px;
}
.tableBox table .formMultiple div{
    margin-bottom: 10px;
}
.tableBox table .formMultiple div:last-child{
    margin-bottom: 0;
}
.tableBox table .formMultiple .postcode_wrap input[type="text"]{
    width: 160px;
}
input[type="text"][readonly]{
    background: #f9f9f9;
}
.tableBox table .btnBasic{
    display: inline-block;
    margin-left: 10px;
    padding: 12px 20px;
    height: 40px;
    font-size: 13px;
    box-sizing: border-box;
    border: 1px solid #bcbcbc;
    line-height: 1;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #000;
    background-color: #fff;
}
.tableBox table #phone1, .tableBox table #phone2, .tableBox table #phone3{
    width: 110px;
    margin: 0 14px;
}
.tableBox table #phone1{
    margin-left: 0;
}
/* #order .shippingInfo .shippingInfoText{
	overflow: hidden;
    padding-top: 9px;
}
#order .shippingInfo .shippingInfoText .name{
	display: block;
    padding-right: 110px;
    color: #333;
    font-size: 16px;
    font-weight: 600;
}
#order .shippingInfo .shippingInfoText .address{
	margin-top: 18px;
	font-size: 15px;
    color: #383838;
}
#order .shippingInfo .shippingInfoText .contact{
	margin-top: 8px;
	font-size: 15px;
    line-height: 22px;
}
#order .sideRight{
	position: absolute;
    top: 60px;
    right: 15px;
}
#order .btnNormal{
	height: 42px;
    line-height: 38px;
    padding: 0 10px;
    vertical-align: middle;
    font-size: 14px;
    font-weight: 400;
	color: #000;
    border: 1px solid #b5b5b5;
    background: #fff;
    cursor: pointer;
} */
#order .orderList{
	position: relative;
	margin: 15px 16px;
	background: #fff;
}
#order .orderList:first-child{
	margin-top: 0;
}
#order .orderList .prdBox{
	display: flex;
	min-height: 104px;
}
#order .orderList .thumbnail{
	overflow: hidden;
    width: 90px;
    height: 90px;
    margin-right: 20px;
    border: 1px solid #d7d5d5;
}
#order .orderList .thumbnail img{
	width: 100%;
	height: 100%;
	vertical-align: top;
}
#order .orderList .description{
	overflow: hidden;
    flex: 1;
    margin-top: -2px;
}
#order .orderList .description .prdName{
	display: block;
    margin-bottom: 9px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.4em;
    color: #000;
}
#order .orderList .description .info{
	margin-bottom: 14px;
    font-size: 14px;
    line-height: 1.4em;
    color: #606060;
}
#order .orderList .description .prdPrice{
	font-size: 15px;
    font-weight: 400;
    line-height: 22px;
    color: #000;
}
#order .delivery{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 11px 16px 11px 16px;
    background: #F8F9FA;
	word-wrap: break-word;
    word-break: break-all;
}
#order .delivery h3{
	font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    color: #606060;
}
#order .delivery .deliveryFee{
	font-size: 14px;
    font-weight: 500;
    color: #000;
}
#order .segment{
	position: relative;
	padding: 0px 16px 20px;
	word-break: break-all;
    word-wrap: break-word;
    color: #383838;
}
#order .segment table{
	table-layout: fixed;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
#order .segment table tr{
	display: table-row;
	vertical-align: middle;
}
#order .segment table tr th{
	font-size: 16px;
    padding: 5px 0;
	font-weight: 400;
    text-align: left;
    vertical-align: top;
    word-break: break-word;
}
#order .segment table tr td{
	font-size: 16px;
    padding: 5px 0;
	font-weight: 700;
	text-align: right;
	vertical-align: middle;
}
#order .totalPrice{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 15px 16px;
    color: #000;
    font-size: 18px;
    font-weight: 700;
    word-wrap: break-word;
    word-break: break-all;
	background-color: #F4F7FF;
}
#order .totalPrice h3{
	margin-right: 4px;
	font-size: 18px;
    font-weight: 600;
}
#order .totalPrice .txtStrong{
	font-size: 22px;
    font-weight: 700;
	color: #111;
}
#order .btnSubmit{
	display: inline-block;
	width: 100%;
	margin-top: 10px;
	font-size: 18px;
    font-weight: 400;
    height: 50px;
    line-height: 50px;
	text-align: center;
    color: #fff;
	background-color: #111;
    border: 1px solid #111;
	cursor: pointer;
}
/* 오티 추가  CSS */
.shipping .contents .desc{
    width: 100%;
    margin: 5px 20px 20px;
}
.shipping .contents .desc .check{
    margin-top: 10px;
}
.shipping .contents .desc .code{
    display: flex;
    align-items: center;
    margin: 0 -9px;
}
input[type="radio"]{
    position: relative;
    opacity: 1;
    width: 18px;
    height: 18px;
    appearance: none;
    background: url("img/icon/bg_radio.png") no-repeat 0 0;
    background-size: 18px 18px;
    vertical-align: middle;
    cursor: pointer;
}
input[type="radio"]:checked{
    background-image: url("img/icon/bg_radio_checked.png");
    transition: 0.2s ease-out;
}
input[type="radio"] + label{
    margin: 0 15px 0 10px;
    vertical-align: middle;
    font-size: 13px;
    /* cursor: default; */
}

/* 오티 추가 CSS 종료 */
</style>
</head>
<body>
	<header id="header">
		<div class="header">
			<h1 class="logo">
				<a href="Main.jsp">리빙앤트리</a>
			</h1>
			<div class="headerMenu gLeft">
				<a href="#" class="btnBack" onclick="history.go(-1); return false;"></a>
			</div>
			<div class="headerMenu gRight">
				<a href="CartProc.do" class="btnBasket">
					<c:if test="${cartCount != null && cartCount > 0}">
                        <span class="cartCount">${cartCount}</span>
                    </c:if>
				</a>
				<a href="Main.jsp?section=MemberLogin.jsp" class="btnMyPage"></a>
			</div>
		</div>
		<div class="titleArea">
			<h1>주문/결제</h1>
		</div>
	</header>
	<section id="order">
		<form action="CartOrderDone.do" name="formname" method="post">
			<div class="shipping fold selected">
				<div class="title">
					<h2>배송지</h2>
					<i class="fa-solid fa-angle-down" aria-hidden="false"></i>
				</div>
				<div class="contents">
				<div class="desc">
                     <div class="check">
                         <input id="check_method1" name="check_method" value="defaultinfo" type="radio" checked="checked">
                         <label for="check_method1">기본정보</label>
                         <input id="check_method2" name="check_method" value="newinfo" type="radio">
                         <label for="check_method2">새정보</label>
                     </div>
                </div>
					<div class="shippingInfo">
						<div class="tableBox">
							<table border="1">
								<tr>
									<th>받는사람</th>   
									<td>
										<input type="text" id="name" name="name">
									</td>
								</tr>
								<tr>
									<th>주소</th>   
									<td class="formMultiple">
										<div class="postcode_wrap">
											<input type="text" id="postcode"  name="postcode" placeholder="우편번호" readonly>
											<input type="button" class="btnBasic" onclick="DaumPostcode()" value="주소검색" style="cursor: pointer;">
										</div>
										<div class="defaultaddr_wrap">
											<input type="text" id="defaultaddr"  name="defaultaddr" placeholder="기본주소" readonly>
										</div>
										<div class="detailaddr_wrap">
											<input type="text" id="detailaddr"  name="detailaddr" placeholder="나머지 주소">
										</div>
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>   
									<td>
										<select id="phone1" name="phone1">
											<option value="010">010</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										-
										<input type="text" id="phone2"  name="phone2" maxlength="4">
										-
										<input type="text" id="phone3"  name="phone3" maxlength="4">
									</td>
								</tr>
								<tr>
									<th>이메일</th>   
									<td>
										<input type="text" id="email" class="hidden" name="email">
									</td>
								</tr>
							</table>
						</div>
						<!-- <div class="shippingInfoText">
							<strong class="name">[기본]김사원</strong>
							<p class="address">[06620]&nbsp;서울 서초구 서초대로74길 11 삼성전자빌딩 asdf</p>
							<p class="contact">010-5555-5555</p>
						</div>
						<span class="sideRight">
							<button type="button" class="btnNormal mini">배송지 목록</button>
						</span> -->
					</div>
				</div>
			</div>
			<div class="orderProduct fold selected">
				<div class="title">
					<h2>주문상품</h2>
					<i class="fa-solid fa-angle-down" aria-hidden="false"></i>
				</div>
				<div class="contents">
					<c:forEach var="chk" items="${chkList}">
						<input type="hidden" name="code" value="${chk.p_code}">
						<input type="hidden" name="img" value="${chk.p_mainimg}">
						<input type="hidden" name="price" value="${chk.p_price}">
						<input type="hidden" name="name" value="${chk.p_name}">
						<input type="hidden" name="cnt" value="${chk.c_qty}">
						<input type="hidden" name="delivfee" value="${chk.p_delivfee}">
						<input type="hidden" name="id" value="${loginId}">
						<input type="hidden" name="c_code" value="${chk.c_code}">
						<div class="orderList">
							<div class="prdBox">
								<div class="thumbnail">
									<a href="ProductInfo.do?p_code=${chk.p_code}">
										<img src="img/productimg/${chk.p_mainimg}">
									</a>
								</div>
								<div class="description">
									<strong class="prdName">
										<a href="ProductInfo.do?p_code=${chk.p_code}">${chk.p_name}</a>  
									</strong>
									<div class="info">수량: ${chk.c_qty}개</div>
									<div class="prdPrice">
										<fmt:formatNumber value="${chk.c_total}" pattern="#,##0"/>원
									</div>
								</div>
							</div>
						</div>
						<div class="delivery">
							<h3>배송비</h3>
							<span class="deliveryFee">
								<c:choose>
									<c:when test="${chk.p_delivfee eq 0}">
										0 (무료)원
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${chk.p_delivfee}" pattern="#,##0"/>원
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="payment fold selected">
				<div class="title">
					<h2>결제정보</h2>
					<i class="fa-solid fa-angle-down" aria-hidden="false"></i>
				</div>
				<div class="contents">
					<div class="segment">
						<table border="0">
							<tr>
								<th class="row">주문상품</th>
								<td class="right">
									<c:set var="itemTotal" value="0" />
									<c:forEach var="chk" items="${chkList}">
										<c:set var="itemTotal" value="${itemTotal + chk.c_total}" />
									</c:forEach>
									<fmt:formatNumber value="${itemTotal}" pattern="#,##0"/>원
								</td>
							</tr>
							<tr>
								<th class="row">배송비</th>
								<td class="right">
									<c:set var="shippingTotal" value="0" />
									<c:forEach var="chk" items="${chkList}">
										<c:set var="shippingTotal" value="${shippingTotal + chk.p_delivfee}" />
									</c:forEach>
									<fmt:formatNumber value="${shippingTotal}" pattern="#,##0"/>원
								</td>
							</tr>
						</table>
					</div>
					<div class="totalPrice">
						<h3 class="heading">최종 결제 금액</h3>
						<strong class="txtStrong">
							<fmt:formatNumber value="${itemTotal+shippingTotal}" pattern="#,##0"/>원
						</strong>
					</div>
				</div>
			</div>
			<button type="button" onclick="purchase()" class="btnSubmit" id="btn_payment">
				<fmt:formatNumber value="${itemTotal+shippingTotal}" pattern="#,##0"/>원 결제하기
			</button>
		</form>
	</section>
	<script>
		let fold = document.querySelectorAll('#order .fold');
		let title = document.querySelectorAll('#order .fold .title');
		// let contents = document.querySelectorAll('#order .fold .contents');

		for(let i=0;i<title.length;i++){
			title[i].addEventListener("click", () => {
				fold[i].classList.toggle('selected');
			})
		}

		// 주소검색 클릭 시 Daum 주소 API가 뜨도록 설정
		function DaumPostcode(){
    	new daum.Postcode({
    		oncomplete: function (data){
    			let addr = '';
    			if(data.userSelectedType === 'R'){
    				addr = data.roadAddress;
    			}else{
    				addr = data.jibunAddress;
    			}
    			document.getElementById('postcode').value = data.zonecode;
    			document.getElementById('defaultaddr').value = addr;
    			document.getElementById('detailaddr').focus();
    		},
    	}).open();	
    	}
		
		let name = document.getElementById('name');
		let postcode = document.getElementById('postcode');
		let defaultaddr = document.getElementById('defaultaddr');
		let detailaddr = document.getElementById('detailaddr');
		let phone1 = document.getElementById('phone1');
		let phone2 = document.getElementById('phone2');
		let phone3 = document.getElementById('phone3');
		let email = document.getElementById('email');
	
		// 휴대전화: ex) 010-0000-0000, 010-111-1111
		const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    	// 이메일: ex) jsp2024@gmail.com, genius@snu.ac.kr
    	const regEmail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]+$/;

		function purchase(){
			let formname = document.formname;
			let phone = phone1.value+"-"+phone2.value+"-"+phone3.value;

			if(name.value === ""){
				alert('이름을 입력해주세요.');
				return;
			}
    		if(defaultaddr.value === "" || detailaddr.value === ""){
				alert('주소를 입력해주세요.');
				return;
			}
    		if(phone2.value === "" || phone3.value === ""){
				alert('휴대전화를 입력해주세요.');
				return;
			}
    		if(email.value === ""){
				alert('이메일을 입력해주세요.');
				return;
			}
			if(!regPhone.test(phone)){
				alert('올바른 휴대전화번호를 입력하세요.');
				return;
			}
			if(!regEmail.test(email.value)){
				alert('입력하신 이메일을 사용할 수 없습니다.');
				return;
			}

			formname.submit();
		}
		
		
		/* 오티 추가 코드  -  배송지 주소 기본과 새로운 주소로 변경하는 코드*/
		let check_method1 = document.querySelector("#check_method1");
        let check_method2 = document.querySelector("#check_method2");
        
        let namevalue = "<c:out value='${mdto.m_name}' />";
        let postcodevalue = "<c:out value='${mdto.m_postcode}' />";
        let defaultaddrvalue = "<c:out value='${mdto.m_defaultaddr}' />";
        let detailaddrvalue = "<c:out value='${mdto.m_detailaddr}' />";
        let emailvalue = "<c:out value='${mdto.m_email}' />";
        /* substr(시작위치, 길이) */
        let telephone = "<c:out value='${mdto.m_phone}' />";
        let telephone1 = telephone.substr(0,3);
        let telephone2 = telephone.substr(4,4);
        let telephone3 = telephone.substr(9,4);
        
        if(check_method1.checked){
        	phone1.value = telephone1;
            phone2.value = telephone2;
            phone3.value = telephone3;
        	name.value = namevalue;
        	postcode.value = postcodevalue;
        	defaultaddr.value = defaultaddrvalue;
        	detailaddr.value = detailaddrvalue;
        	email.value = emailvalue;
        }
       check_method1.addEventListener("change", () =>{
        	phone1.value = telephone1;
            phone2.value = telephone2;
            phone3.value = telephone3;
        	name.value = namevalue;
        	postcode.value = postcodevalue;
        	defaultaddr.value = defaultaddrvalue;
        	detailaddr.value = detailaddrvalue;
        	email.value = emailvalue;
        })
        check_method2.addEventListener("change", () =>{
            phone2.value = "";
            phone3.value = "";
        	name.value = "";
        	postcode.value = "";
        	defaultaddr.value = "";
        	detailaddr.value = "";
        	email.value = "";
        })

	</script>
</body>
</html>