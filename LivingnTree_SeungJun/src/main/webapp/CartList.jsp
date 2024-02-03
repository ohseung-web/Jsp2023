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
.cartContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.cartContainer .cartContents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
}
.cartContainer .cartContents .prdEmpty{
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 60px 0;
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
    font-size: 16px;
    color: #9a9a9a;
	text-align: center;
}
.cartContainer .cartContents .prdEmpty svg{
	display: block;
	max-width: 100%;
    height: auto;
	margin-bottom: 16px;
}
.cartContainer .cartContents .cartPackage{
	display: flex;
}
.cartPackage .cartProduct{
	position: relative;
	flex: 1;
}
.cartPackage .cartProduct .title{
	position: relative;
    overflow: hidden;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
    font-size: 13px;
    line-height: 1.3;
	z-index: 1;
	cursor: pointer;
}
.cartPackage .cartProduct .title h3{
	display: inline-block;
	font-size: 16px;
	padding: 20px 0;
}
.cartPackage .cartProduct .title i{
	vertical-align: center;
	transition: transform 0.3s;
}
.cartPackage .cartProduct.on .title i{
	transform: rotate(180deg);
    transition: transform 0.3s; 
}
.cartPackage .cartProduct .contents{
	display: none;
	background: #fff;
}
.cartPackage .cartProduct.on .contents{
	display: block;
}
.orderList .prdBox{
	position: relative;
	padding: 35px 0;
	display: flex;
    flex-wrap: wrap;
}
.orderList .prdBox input[type="checkbox"]{
	display: inline-block;
	margin-right: 10px;
	width: 24px;
    height: 24px;
    border: 1px solid #d9d9d9;
    appearance: none;
    background: url(img/icon/checkbox_off.svg) no-repeat center;
    transition: none;
}
.orderList .prdBox input[type="checkbox"]:checked{
	background: url(img/icon/checkbox_on.svg) no-repeat center;
    transition: none;
}
.orderList .prdBox .thumbnail{
	overflow: hidden;
	width: 120px;
	height: 120px;
	margin-right: 15px;
}
.orderList .prdBox .thumbnail img{
	width: 100%;
	height: 100%;
	vertical-align: top;
}
.orderList .prdBox .description{
	flex: 1;
	margin-right: 20%;
	line-height: 18px;
}
.orderList .prdBox .description .prdName{
	display: block;
    margin-bottom: 3px;
    font-weight: normal;
}
.orderList .prdBox .description .prdName a{
	color: #000;
}
.orderList .prdBox .description .price{
	font-size: 13px;
    color: #000;
    line-height: 20px;
}
.orderList .prdBox .description .delivfee{
	margin-top: 5px;
	font-size: 12px;
    color: #7d7d7d;
}
.orderList .prdBox .quantity{
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin: 24px 0;
	padding-left: 37px;
}
.orderList .prdBox .quantity .label{
	flex: 1;
    font-size: 14px;
    color: #7a7a7a;
}
.orderList .prdBox .quantity .qtyContainer{
	position: relative;
	display: flex;
	width: 125px;
	vertical-align: top;
}
.orderList .prdBox .quantity .qtyContainer input[type="button"]{
	overflow: hidden;
	width: 40px;
	height: 40px;
	font-size: 13px;
	line-height: 38px;
	color: #000;
	border: 1px solid #e5e5e5;
	background-color: #fff;
    white-space: nowrap;
    cursor: pointer;
}
.orderList .prdBox .quantity .qtyContainer input[type="text"]{
	width: 45px;
	height: 40px;
	margin-left: -1px;
	font-size: 13px;
	line-height: 38px;
	color: #000;
    border: 1px solid #e5e5e5;
    text-align: center;
	vertical-align: middle;
	outline: 1px;
}
.orderList .prdBox .sumPrice{
    display: flex;
    align-items: center;
    width: 100%;
    margin: 0 0 24px 37px;
	padding-top: 24px;
	text-align: right;
    border-top: 1px solid #e8e8e8;
}
.orderList .prdBox .sumPrice .label{
	flex: 1;
    font-size: 14px;
    color: #1a1a1a;
    text-align: left;
}
.orderList .prdBox .sumPrice strong{
	font-size: 16px;
	font-weight: 700;
}
.cartPackage .cartProduct .contents .deleteBtnBox{
	display: flex;
	justify-content: flex-start;
	margin: 20px 0;
}
.cartPackage .cartProduct .contents .deleteBtnBox button:first-child{
	margin-right: 10px;
}
.btnNormal{
	display: inline-block;
	border: 1px solid #d0ac88;
    color: #d0ac88;
	background-color: #fff;
	vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
	cursor: pointer;
}
.btnSubmit{
	display: inline-block;
	border: 1px solid transparent;
    color: #fff;
	background: #d0ac88;
	vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
	cursor: pointer;
}
.sizeS{
	height: 50px;
    padding: 17px 20px;
    line-height: 1;
    font-size: 14px;
	font-weight: 400;
}
.sizeL{
	width: 100%;
	height: 56px;
    line-height: 56px;
    font-size: 16px;
	font-weight: 400;
}
.cartPackage .cartTotal{
	position: relative;
	width: 360px;
	margin-left: 47px;
}
.cartPackage .cartTotal .totalSummary{
	padding: 30px 24px;
	border: 1px solid #000;
}
.cartPackage .cartTotal .totalSummary .totalItem{
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 25px;
	margin-bottom: 15px;
}
.cartPackage .cartTotal .totalSummary .totalItem .title{
	font-size: 16px;
	font-weight: 400;
    color: #1a1a1a;
}
.cartPackage .cartTotal .totalSummary .totalItem .data{
	font-size: 14px;
    color: #1a1a1a;
	text-align: right;
}
.cartPackage .cartTotal .totalSummary .totalItem .data strong{
	font-size: 16px;
    font-weight: 400;
    color: #1a1a1a;
}
.cartPackage .cartTotal .totalSummary .totalShipping{
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 45px;
	margin-bottom: 15px;
}
.cartPackage .cartTotal .totalSummary .totalShipping .title{
	font-size: 16px;
	font-weight: 400;
    color: #1a1a1a;
}
.cartPackage .cartTotal .totalSummary .totalShipping .data{
	font-size: 14px;
    color: #1a1a1a;
	text-align: right;
}
.cartPackage .cartTotal .totalSummary .totalShipping .data strong{
	font-size: 16px;
    font-weight: 400;
    color: #1a1a1a;
}
.cartPackage .cartTotal .totalSummary .total{
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 30px;
	padding-top: 30px;
	border-top: 1px solid #e8e8e8;
}
.cartPackage .cartTotal .totalSummary .total .title{
	font-size: 16px;
	font-weight: 700;
    color: #1a1a1a;
}
.cartPackage .cartTotal .totalSummary .total .data{
	font-size: 14px;
	color: #1a1a1a;
	text-align: right;
}
.cartPackage .cartTotal .totalSummary .total .data strong{
	display: inline-block;
	font-size: 16px;
	font-weight: 700;
	word-break: break-all;
}
.cartPackage .cartTotal .totalOrder{
	margin: 20px 0;
}
.cartPackage .cartTotal .totalOrder .btnNormal{
	margin-top: 10px;
}
.cartContainer .cartContents .cartGuide{
	width: 100%;
	margin: 50px 0 30px;
	line-height: 18px;
}
.cartGuide h3{
	display: block;
    margin-bottom: 20px;
    font-size: 16px;
	font-weight: 700;
    color: #000;
}
.cartGuide .inner{
	padding: 20px;
    border: 1px solid #e5e5e5;
	border-top: 2px solid #1a1a1a;
}
.cartGuide .inner h4:first-child{
	margin-top: 0;
}
.cartGuide .inner h4{
	margin: 22px 0 -4px;
    color: #000;
    font-size: 12px;
    font-weight: 400;
}
.cartGuide .inner ul{
	margin-top: 15px;
}
.cartGuide .inner ul li{
	padding-left: 12px;
    font-size: 12px;
    line-height: 21px;
	color: #6d6d6d;
}
.cartGuide .inner ul li::before{
	content: "";
    display: inline-block;
    width: 3px;
    height: 3px;
    margin: 7px 9px 0 -12px;
    vertical-align: top;
    border-radius: 50%;
    background: #6d6d6d;
}
/* 오티수정 CSS 시작 */
 .title h2{
	margin: 80px 0 40px;
    text-align: center;
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
 .cartContainer .cartContents .navselect li{
     display: inline-block;
     
  }
 .cartContainer .cartContents .navselect li a{
    position : absolute;
    border: 1px solid #1a1a1a; 
    font-weight: 400;
    padding : 16px 20px;
    background: #fff;
    font-size: 13px;
    min-width: 170px;
    text-align: center;
    border-bottom: none;
    top : -32px;
    left :0;
 }
 .cartContainer .cartContents .navselect{
    /* width : 1400px;  */
    position: relative;
    border-bottom: 1px solid #1a1a1a; 
    margin: 0 0 50px; 
    background: #fff;
 }
 /* 오티수정 CSS  종료*/
</style>
</head>
<body>
	<!-- <c:forEach var="c" items="${cList}">
		${c.p_code }<br/>
		${c.p_code }<br/>
		${c.p_name }<br/>
		${c.p_mainimg }<br/>
		${c.p_price }<br/>
		${c.p_delivfee }<br/>
		${c.c_qty }<br/>
		${c.c_total }<br/>
		${c.m_id }<br/>
		<br/>
	</c:forEach> -->
	<!-- 오티 수정 코드 -->
	<div class="title">
    <h2>장바구니</h2>
    </div>
    <div class="cartContainer">
       <div class="cartContents"> 
        <ul class="navselect">
          <li><a href="#">국내배송상품</a></li>
       </ul>
    </div>
   </div>
   <!-- 오티 수정 코드 종료  --> 
	<div class="cartContainer">
		<div class="cartContents">
			<c:choose>
				<c:when test="${not empty cList}">
					<div class="cartPackage">
						<div class="cartProduct on">
							<div class="title">
								<h3>장바구니 상품</h3>
								<i class="fa-solid fa-angle-up" aria-hidden="false"></i>
							</div>
							<div class="contents">
								<c:set var="index" value="0"/>
								<c:forEach var="c" items="${cList}">
									<form action="CartDelete.do" method="post">
										<div class="orderList">
											<div class="prdBox">
												<input type="checkbox" class="cartChk" name="cartChk" value="${c.c_code}">
												<div class="thumbnail">
													<a href="ProductInfo.do?p_code=${c.p_code}">
														<img src="img/productimg/${c.p_mainimg}">
													</a>
												</div>
												<div class="description">
													<strong class="prdName">
														<a href="ProductInfo.do?p_code=${c.p_code}">${c.p_name}</a>
													</strong>
													<p class="price">
														<fmt:formatNumber value="${c.p_price}" pattern="#,##0"/>원
													</p>
													<p class="delivfee">
														배송&nbsp;:&nbsp;
														<c:choose>
															<c:when test="${c.p_delivfee eq 0}">
																[무료]
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${c.p_delivfee}" pattern="#,##0"/>원
															</c:otherwise>
														</c:choose>
													</p>
												</div>
												<div class="quantity">
													<span class="label">수량</span>
													<div class="qtyContainer">
														<input type="button" value="－" class="minus" onclick="fn_update(false,${index},this.form)">
														<input type="text" name="cnt" value="${c.c_qty}" class="spancnt" readonly>
														<input type="button" value="＋" class="plus" onclick="fn_update(true,${index},this.form)">
														<input type="hidden" name="code" value="${c.c_code}" class="cartcode">
													</div>
												</div>
												<div class="sumPrice">
													<span class="label">주문금액</span>
													<strong><fmt:formatNumber value="${c.c_total}" pattern="#,##0"/></strong>
													원
												</div>
											</div>
											<!-- <a href="#" class="btnDelete"></a> -->
										</div>
									</form>
									<c:set var="index" value="${index=index+1}"/>
								</c:forEach>
								<div class="deleteBtnBox">
									<button class="btnNormal sizeS" onclick="fn_allDelete()">전체삭제</button>
									<button class="btnNormal sizeS" onclick="fn_delete()">선택삭제</button>
								</div>
							</div>
						</div>
						<div class="cartTotal">
							<div class="totalSummary">
								<div class="totalItem">
									<h4 class="title">총 상품금액</h4>
									<div class="data">
										<strong><fmt:formatNumber value="${itemTotal}" pattern="#,##0" /></strong>
										원
									</div>
								</div>
								<div class="totalShipping">
									<h4 class="title">총 배송비</h4>
									<div class="data">
										<strong><fmt:formatNumber value="${shippingTotal}" pattern="#,##0" /></strong>
										원
									</div>
								</div>
								<div class="total">
									<h3 class="title">결제예정금액</h3>
									<div class="data">
										<strong><fmt:formatNumber value="${itemTotal+shippingTotal}" pattern="#,##0" /></strong>
										원
									</div>
								</div>
							</div>
							<div class="totalOrder">
								<button class="btnSubmit sizeL">주문하기</button>
								<button class="btnNormal sizeL">관심상품</button>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="prdEmpty">
						<svg xmlns="http://www.w3.org/2000/svg" width="65" height="64" fill="none" viewBox="0 0 65 64" class="icon" role="img"><path d="M63.3 32C63.3 49.0104 49.5104 62.8 32.5 62.8C15.4896 62.8 1.7 49.0104 1.7 32C1.7 14.9896 15.4896 1.2 32.5 1.2C49.5104 1.2 63.3 14.9896 63.3 32Z" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 18.6665V34.6665" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M32.5 40V44" stroke="#D9D9D9" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"></path></svg>
						장바구니가 비어 있습니다.
					</div>
				</c:otherwise>
			</c:choose>
			<div class="cartGuide">
				<h3>이용안내</h3>
				<div class="inner">
					<h4>장바구니 이용안내</h4>
					<ul>
						<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
						<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
						<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
						<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
						<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
						<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
					</ul>
					<h4>무이자할부 이용안내</h4>
					<ul>
						<li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
						<li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
						<li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
						<li>무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.<br>실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		let title = document.querySelector(".cartPackage .cartProduct .title");
		let cartProduct = document.querySelector(".cartPackage .cartProduct");

		title.addEventListener("click", () => {
			cartProduct.classList.toggle('on');
		})

		let cnt = document.querySelectorAll(".spancnt");
		let chk_list = document.querySelectorAll(".cartChk"); // checkbox에 담겨진 code 값을 배열로 처리한 것
		let param = ""; // checkbox에 담겨진 code 값을 담을 변수

		let loginId = "<c:out value='${loginId}' />";
		function fn_allDelete() {
			param = "";
			for (let i = 0; i < chk_list.length; i++) {
				param = param + chk_list[i].value + " ";
			}

			let deleteAllInput = confirm('상품 전체를 삭제하시겠습니까?');
			if(deleteAllInput){
				location.href = 'CartDelete.do?chk=' + param;
			}
		}

		function fn_delete() {
			param = "";
			for (let i = 0; i < chk_list.length; i++) {
				if (chk_list[i].checked) { // 장바구니에서 선택된 no값만 넘기는 코드
					param = param + chk_list[i].value + " ";
				}
			}
			
			if(param === ""){
				alert('선택된 상품이 없습니다.');
			}else{
				let deleteInput = confirm('선택하신 상품을 삭제하시겠습니까?');
				if(deleteInput){
					location.href = 'CartDelete.do?chk=' + param;
				}
			}
		}

		function fn_update(isBool, i, f) {
			if (isBool == false) {
				// - 버튼
				if (parseInt(cnt[i].value) > 1) {
					cnt[i].value = parseInt(cnt[i].value) - 1;
				} else {
					alert('최소 주문수량은 1개입니다.');
				}
			} else {
				// + 버튼
				if (parseInt(cnt[i].value) < 100) {
					cnt[i].value = parseInt(cnt[i].value) + 1;
				} else {
					alert('최대 주문수량은 100개입니다.');
				}
			}

			// +,-버튼을 눌렀을 때 cnt가 update되는 servlet으로 보내야 함
			// <form action="CartUpdate.do" method="">
			f.action = "CartUpdate.do";
			f.submit();
		}

		function OrderList() {
			if (loginId == "") {
				location.href = "Main.jsp?section=MemberLogin.jsp";
			} else {
				for (let i = 0; i < chk_list.length; i++) {
					if (chk_list[i].checked) { // 장바구니에서 선택된 code값만 넘기는 코드
						param = param + chk_list[i].value + " ";
					}
				}

				location.href = 'CartOrderPro.do?chk=' + param + '&loginId=' + loginId;
			}
		}
	</script>
</body>
</html>