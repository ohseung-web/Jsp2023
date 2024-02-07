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
#order .shippingInfo .shippingInfoText{
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
}
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
				<a href="CartProc.do" class="btnBasket"></a>
				<a href="#" class="btnMyPage"></a>
			</div>
		</div>
		<div class="titleArea">
			<h1>주문/결제</h1>
		</div>
	</header>
	<section id="order">
		<form action="CartOrderDone.do" method="post">
			<div class="shipping fold selected">
				<div class="title">
					<h2>배송지</h2>
					<i class="fa-solid fa-angle-down" aria-hidden="false"></i>
				</div>
				<div class="contents">
					<div class="shippingInfo">
						<div class="shippingInfoText">
							<strong class="name">[기본]김사원</strong>
							<p class="address">[06620]&nbsp;서울 서초구 서초대로74길 11 삼성전자빌딩 asdf</p>
							<p class="contact">010-5555-5555</p>
						</div>
						<span class="sideRight">
							<button type="button" class="btnNormal mini">배송지 목록</button>
						</span>
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
			<button type="submit" class="btnSubmit" id="btn_payment">
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
	</script>
</body>
</html>