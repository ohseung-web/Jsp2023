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
.title h2{
	margin: 80px 0 40px;
    text-align: center;
	font-weight: 700;
    font-size: 32px;
    color: #1f1f1f;
}
.cartContainer{
    position: relative;
    /* display: flex;
    justify-content: center; */
    width: 100%;
}
.cartContainer .cartContents{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
    margin : 0 auto;
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
 .cartContainer2 .cartContents2 .cartGuide{
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
/* 빈 장바구니 CSS - 오티 수정 */
.cartContainer2{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.cartContainer2 .cartContents2{
    max-width: 1480px;
    width: 92%;
    margin: 50px 0;
}
.nullbox{
    display: flex;
    justify-content: center;
    width: 100%;
}
 .nullbox .nullbox_wrap .nullimg {
    display : flex;
    justify-content : center;
    align-items: center;
 }
 .nullbox .nullbox_wrap .nulltext {
    width: cal( 100% - 200px );
    height : 50px;
    text-align: center;
    font-size: 17px;
    color : gray;
    line-height: 50px;
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
    top : -29px;
    left :0;
 }
 .cartContainer .cartContents .navselect{
    /* width : 1400px;  */
    position: relative;
    border-bottom: 1px solid #1a1a1a; 
    margin: 0 0 50px; 
    background: #fff;
 }

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
	<div class="cartContainer">
	 <c:choose>
         <c:when test="${not empty cList}">
		<div class="cartContents">
			<div class="cartPackage">
				<div class="cartProduct on">
					<div class="title">
						<h3 >장바구니 상품</h3>
						<i class="fa-solid fa-angle-up" aria-hidden="false"></i>
					</div>
					<div class="contents">
						<c:set var="index" value="0"/>
						<c:forEach var="c" items="${cList}">
							<form action="CartDelete.do" method="post">
								<div class="orderList">
									<div class="prdBox">
										<input type="checkbox" id="cartChk" name="cartChk" value="${c.c_code}">
										<div class="thumbnail">
											<a href="Main.jsp?section=ProductInfo.jsp?${c.p_code}">
												<img src="img/productimg/${c.p_mainimg}">
											</a>
										</div>
										<div class="description">
											<strong class="prdName">
												<a href="Main.jsp?section=ProductInfo.jsp?${c.p_code}">${c.p_name}</a>
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
												<input type="text" name="cnt" value="${c.c_qty}" class="spancnt">
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
								<strong>
									<span class="totalItemPrice"></span>
								</strong>
								원
							</div>
						</div>
						<div class="totalShipping">
							<h4 class="title">총 배송비</h4>
							<div class="data">
								<strong>
									<span class="totalDelivPrice"></span>
								</strong>
								원
							</div>
						</div>
						<div class="total">
							<h3 class="title">결제예정금액</h3>
							<div class="data">
								<strong>
									<span class="totalPrice"></span>
								</strong>
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
	      <div class="nullbox">
	        <div class="nullbox_wrap">
	            <div class="nullimg"><img alt="" src="img/icon/nullCart.png"></div>
	            <div class="nulltext">장바구니가 비어있습니다.</div>
	        </div> 
	      </div>
	   </c:otherwise>  		
	</c:choose>	
</div>		
 <!-- 장바구니 이용안내 부분 -->	
   <div class="cartContainer2">
       <div class="cartContents2">   				
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
	</script>
</body>
</html>