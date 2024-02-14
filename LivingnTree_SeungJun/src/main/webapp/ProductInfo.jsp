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
<style>
.infoContainer{
    position: relative;
    display: flex;
    justify-content: center;
    width: 100%;
}
.infoContainer .contents{
    max-width: 1280px;
    width: 92%;
    margin: 50px 0;
}
.infoContainer .contents .detailArea{
	display: flex;
    margin-bottom: 71px;
    padding-top: 30px;
}
.detailArea .imgArea{
    display: inline-block;
    width: calc(100% - 700px);
}
.detailArea .imgArea img{
    width: 100%;
    height: auto;
    vertical-align: top;
}
.detailArea .infoArea{
    display: inline-block;
    width: 600px;
    margin-left: 100px;
    font-size: 13px;
    vertical-align: top;
}
.detailArea .infoArea .headingArea{
    padding: 0 60px 10px 0;
}
.detailArea .infoArea .headingArea h1{
    display: inline;
    font-size: 26px;
    font-weight: 300;
    line-height: 30px;
    vertical-align: middle;
    color: #1a1a1a;
}
table{
    width: 100%;
    border: none;
    border-spacing: 0;
    border-collapse: collapse;
}
.detailArea .infoArea .detailDesign table{
    margin-top: 20px;
    table-layout: fixed;
    margin: 10px 0;
    font-size: 13px;
    line-height: 18px;
}
.detailArea .infoArea .detailDesign table th{
    font-weight: normal;
    width: 106px;
    padding: 7px 5px 6px 0;
    text-align: left;
    vertical-align: top;
}
.detailArea .infoArea .detailDesign table td{
    padding: 7px 6px 8px 0;
    vertical-align: middle;
}
.detailArea .infoArea .detailDesign table td strong{
    margin-right: 5px;
}
.detailArea .infoArea .guideArea{
    margin: 20px 0;
    font-size: 13px;
}
.detailArea .infoArea .totalProducts{
    margin-top: 50px;
}
.detailArea .infoArea .totalProducts table{
    table-layout: fixed;
    font-size: 13px;
    line-height: 18px;
}
.detailArea .infoArea .totalProducts table tr{
    display: table-row;
    background: #faf7f3;
    vertical-align: middle;
}
.detailArea .infoArea .totalProducts table tr td{
    padding: 30px 0;
    line-height: 18px;
    vertical-align: middle;
    word-wrap: break-word;
    word-break: break-all;
}
.detailArea .infoArea .totalProducts table tr td:first-child{
    width: 40%;
    padding: 30px 10px 30px 25px;
    font-size: 13px;
}
.detailArea .infoArea .totalProducts table tr .right{
    padding-right: 25px;
    font-size: 14px;
    font-weight: 400;
    color: #000;
    text-align: right;
}
.totalProducts .quantity{
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    width: 103px !important;
    /* padding: 0 30px; */
    vertical-align: top;
}
.totalProducts #quantity{
    width: 45px;
    height: 30px;
    font-size: 13px;
    line-height: 28px;
    margin-left: -1px;
    padding: 0;
    border: 1px solid #e5e5e5;
    text-align: center;
    background: #fff;
}
.totalProducts .minus, .totalProducts .plus{
    width: 30px;
    height: 30px;
    border: 1px solid #e5e5e5;
    box-sizing: border-box;
    overflow: hidden;
    white-space: nowrap;
    font-size: 14px;
    line-height: 1px;
    background: #fff;
    cursor: pointer;
}
.detailArea .infoArea .totalPrice{
	display: flex;
	justify-content: flex-end;
    align-items: center;
    padding: 50px 0 100px;
    font-size: 20px;
    font-weight: 300;
    letter-spacing: -0.05em;
    color: #1a1a1a;
    border: none;
}
.detailArea .infoArea .totalPrice .total{
    display: flex;
    align-items: center;
    font-size: 13px;
    color: #7d7d7d;
}
.detailArea .infoArea .totalPrice .total strong{
    margin: 0 5px 0 20px;
}
.detailArea .infoArea .totalPrice .total strong em{
    font-size: 28px;
    font-weight: 500;
    letter-spacing: -0.05em;
    color: #1a1a1a;
}
.detailArea .infoArea .totalPrice .total #innerCnt{
	font-size: 13px;
    color: #7d7d7d;
}
.detailArea .infoArea .actionButton{
    display: flex;
}
.detailArea .infoArea .actionButton .btnSubmit{
    display: inline-block;
    flex: 2;
    height: 66px;
    padding: 23px 0;
    font-size: 16px;
    font-weight: 400;
    line-height: 18px;
    border: 1px solid transparent;
    background: #d0ac88;
    color: #fff;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    outline: none;
    cursor: pointer;
}
.detailArea .infoArea .actionButton .btnNormal{
    display: inline-block;
    margin-left: 12px;
    flex: 1;
    height: 66px;
    padding: 23px 0;
    font-size: 16px;
    font-weight: 400;
    transition: all 0.3s;
    line-height: 18px;
    border: 1px solid #d0ac88;
    color: #d0ac88;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    outline: none;
    background-color: #fff;
    cursor: pointer;
}
.additional{
	margin-bottom: 120px;
}
.additional .tabProductBox{
	height: 61px;
    margin: 0 auto 90px;
}
.additional .tabProductBox .tabProduct{
	margin: 0 auto;
    padding: 15px 0;
    background-color: #fff;
}
.tabProduct ul{
	display: flex;
	justify-content: center;
	margin: 0 auto;
	max-width: 800px;
}
.tabProduct ul li{
	width: 24%;
	text-align: center;
}
.tabProduct ul li a{
	position: relative;
    display: inline-block;
    font-weight: 400;
    font-size: 20px;
    color: #9a9a9a;
    letter-spacing: -0.05em;
    white-space: nowrap;
}
.tabProduct ul li.selected a{
	font-weight: 600;
    color: #d0ac88;
    background-color: #fff;
    border-bottom: 2px solid #d0ac88;
}
.tabProduct ul li a span{
	position: absolute;
    top: -10px;
    right: -10px;
    display: block;
    padding: 0 5px;
    height: 15px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 16px;
    text-indent: -0.5px;
    background-color: #9a9a9a;
    border-radius: 15px;
}
.additional .tabProductBox .prdDetail{
	margin-bottom: 100px;
}
.prdDetail img{
	max-width: 100% !important;
    height: auto !important;
}
.additional .tabProductBox .prdReview, .additional .tabProductBox .prdQna{
	display: none;
}
.prdReview .board_title, .prdQna .board_title{
	display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
}
.prdReview .board_title h2, .prdQna .board_title h2{
	font-size: 20px;
    font-weight: 400;
}
.prdReview .board_title .btnBox .normalBtn, .prdQna .board_title .btnBox .normalBtn{
	display: inline-block;
	width: 110px;
	height: 40px;
	padding: 12px 20px;
    font-size: 13px;
    font-weight: 400;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
	border: 1px solid #d0ac88;
    color: #d0ac88;
    background-color: #fff;
    cursor: pointer;
}
.prdReview .board_title .btnBox .normalBtn:hover, .prdQna .board_title .btnBox .normalBtn:hover{
    border-color: #ac5600;
}
/* .prdReview .board_contents{
    
} */
.additional .nodata{
	padding: 56px 0;
    color: #6d6d6d;
    text-align: center;
}
</style>
</head>
<body>
	<div class="infoContainer">
        <div class="contents">
            <div class="detailArea">
                <div class="imgArea">
                    <img src="img/productimg/${pdto.p_mainimg}">
                </div>
                <form action="CartProc.do" method="post">
                	<div class="infoArea">
                    	<div class="headingArea">
                        	<h1>${pdto.p_name}</h1>
                    	</div>
                    	<div class="detailDesign">
                        	<table>
                            	<tr>
                                	<th><span style="font-size: 16px;
                                    	color: #e51623;
                                    	font-weight: bold;">판매가</span></th>
                                	<td><span style="font-size: 16px;
                                    	color: #e51623;
                                    	font-weight: bold;"><fmt:formatNumber value="${pdto.p_price}" pattern="#,##0"/>원</span></td>
                            	</tr>
                            	<tr>
                                	<th><span style="font-size: 11px;
                                    	color: #555555;">원산지</span></th>
                                	<td><span style="font-size: 11px;
                                    	color: #555555;">${pdto.p_occ}</span></td>
                            	</tr>
                            	<tr>
                                	<th><span style="font-size: 11px;
                                    	color: #555555;">배송비</span></th>
                                	<td><span style="font-size: 11px;
                                    	color: #555555;"><fmt:formatNumber value="${pdto.p_delivfee}" pattern="#,##0"/>원</span></td>
                            	</tr>
                        	</table>
                    	</div>
                    	<div class="guideArea">(최소주문수량 1개 이상)</div>
                    	<div class="totalProducts">
                        	<table>
                        		<%-- <c:set var="cnt" value="1"></c:set> --%>
                            	<tr>
                                	<td>${pdto.p_name}</td>
                                	<td>
                                    	<span class="quantity">
                                        	<input type="button" value="－" class="minus" onclick="fn_update(false)">
                                        	<input type="text" name="cnt" id="quantity" value="1" readonly>
                                        	<input type="button" value="＋" class="plus" onclick="fn_update(true)">
                                        	<input type="hidden" name="code" value="${pdto.p_code}">
                                        	<%-- <input type="hidden" name="category" value="${pdto.p_category}"> --%>
                                        	<input type="hidden" name="name" value="${pdto.p_name}">
                                        	<input type="hidden" name="mainimg" value="${pdto.p_mainimg}">
                                        	<input type="hidden" name="price" value="${pdto.p_price}">
                                        	<input type="hidden" name="delivfee" value="${pdto.p_delivfee}">
                                    	</span>
                                	</td>
                                	<td class="right" id="priceTotal1">
                                    	<fmt:formatNumber value="${pdto.p_price}" pattern="#,##0"/>원
                                	</td>
                            	</tr>
                            	<%-- <c:set var="cnt" value="${cnt = cnt + 1}"></c:set> --%>
                        	</table>
                    	</div>
                    	<div class="totalPrice">
                    		TOTAL
                    		<span class="total">
                    			<strong>
                    			<em id="priceTotal2"><fmt:formatNumber value="${pdto.p_price}" pattern="#,##0"/>원</em>
                    			</strong>
                    			(<span id="innerCnt">1</span>개) 
                    		</span>
                    	</div>
                    	<div class="actionButton">
                    		<button type="button" class="btnSubmit" onclick="">BUY IT NOW</button>
                    		<button type="submit" class="btnNormal actionCart">CART</button>
                    		<button type="button" class="btnNormal actionWish" onclick="location.href='myShopProc.do?code=${pdto.p_code}&mainimg=${pdto.p_mainimg}&price=${pdto.p_price}'">WISH LIST</button>
                    	</div>
                    </div>
                </form>
            	</div>
            <div class="additional">
                <div class="tabProductBox">
                    <div class="tabProduct">
                        <ul>
                            <li class="selected">
                                <a href="#">Detail</a>
                            </li>
                            <li class>
                                <a href="#">Review<span>0</span></a>
                                <!-- 리뷰 게시판 작성완료 후 수정할 예정 -->
                            </li>
                            <li class>
                                <a href="#">Q&A<span>0</span></a>
                                <!-- 문의 게시판 작성완료 후 수정할 예정 -->
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="prdDetail">
                    <div style="text-align: center;">
                        <br>
                        <img src="img/detailimg/0_top.jpg">
                        <br>
                        <img src="img/detailimg/${pdto.p_detailimg}">
                        <br>
                        <img src="img/detailimg/1_caution.jpg">
                        <br>
                        <img src="img/detailimg/2_delivery.jpg">
                    </div>
                </div>
                <div class="prdReview" style="display: none;">
                    <div class="board_title">
                        <h2>REVIEW</h2>
                        <div class="btnBox">
                            <a href="ReviewBoardList.do" class="normalBtn">LIST</a>
                            <a href="Main.jsp?section=ReviewBoardWrite.jsp?p_code=${pdto.p_code}" class="normalBtn">WRITE</a>
                        </div>
                    </div>
                    <div class="board_contents">
                        <p class="nodata">게시물이 없습니다.</p>
                        <!-- 리뷰 게시판 작성완료 후 수정할 예정 -->
                    </div>
                </div>
                <div class="prdQna" style="display: none;">
                    <div class="board_title">
                        <h2>Q&A</h2>
                        <div class="btnBox">
                            <a href="#" class="normalBtn">LIST</a>
                            <a href="#" class="normalBtn">WRITE</a>
                        </div>
                    </div>
                    <div class="board_contents">
                        <p class="nodata">게시물이 없습니다.</p>
                        <!-- 문의 게시판 작성완료 후 수정할 예정 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- javascript 코드 -->
    <script>
    	let quantity = document.querySelector("#quantity");
    	let minus = document.querySelector(".quantity .minus");
    	let plus = document.querySelector(".quantity .plus");
    	let priceTotal1 = document.querySelector("#priceTotal1");
    	let priceTotal2 = document.querySelector("#priceTotal2");
    	let price = "<c:out value='${pdto.p_price}' />";
    	let innerCnt = document.querySelector("#innerCnt");
    	
    	function fn_update(isBool){
    		if(isBool){
    			if(parseInt(quantity.value) >= 100){
    				alert('최대 주문수량은 100개입니다.'); 
    			}else{
    				quantity.value = parseInt(quantity.value) + 1;
    			}
    		}else{
    			if(parseInt(quantity.value) <= 1){
    				alert('최소 주문수량은 1개입니다.');
    			}else{
    				quantity.value = parseInt(quantity.value) - 1;
    				
    			}
    		}
    		
    		priceTotal1.innerText = (parseInt(quantity.value) * price).toLocaleString((parseInt(quantity.value) * price));
	    	priceTotal2.innerText = (parseInt(quantity.value) * price).toLocaleString((parseInt(quantity.value) * price));
    		innerCnt.innerText = quantity.value;
    		//f.submit();
    	}
  
    	// Detail, Review, Q&A 메뉴 스크립트 짜기
        let tabProducts = document.querySelectorAll(".tabProduct ul li");
        let prdDetail = document.querySelector(".prdDetail");
        let prdReview = document.querySelector(".prdReview");
        let prdQna = document.querySelector(".prdQna");

        for(let i=0;i<tabProducts.length;i++){
            tabProducts[i].addEventListener("click",() => {
                for(let j=0;j<tabProducts.length;j++){
                    tabProducts[j].classList.remove('selected');
                }
                prdDetail.style.display = "none";
                prdReview.style.display = "none";
                prdQna.style.display = "none";

                tabProducts[i].classList.add('selected');
                if(i===0){
                    prdDetail.style.display = "block";
                }else if(i===1){
                    prdReview.style.display = "block";
                }else{
                    prdQna.style.display = "block";
                }
            })
        }
    </script>
</body>
</html>