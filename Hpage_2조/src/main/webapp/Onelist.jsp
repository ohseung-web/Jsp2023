<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        #onelist_wrap{width: 1400px; margin: 50px auto;}
        #onelist_wrap input{outline: none;}
        #onelist_wrap .oneimg img{width: 640px;}
        #onelist_wrap .oneimg{display: inline-block; padding-left: 50px;}
        #onelist_wrap .info{display: inline-block;vertical-align: top; width: 600px; height: 640px; font-size: 0.85em; padding-left: 80px;}
        #onelist_wrap .info p{margin: 20px 0;}
        #onelist_wrap .delivery1, #onelist_wrap .delivery2{display: inline-block; margin: 20px 0;}
        #onelist_wrap .delivery1{vertical-align: top; margin: 20px 60px 0 0;}
        #onelist_wrap .info select{border: 1px solid lightgray; width: 120px; height: 40px; padding-left: 10px;}
        #onelist_wrap .info .price{font-size: 1em;}
        #onelist_wrap .info .btn .purchase{width: 150px; height: 50px; background: none; margin: 20px 10px 0 0; border: 2px solid black;}
        #onelist_wrap .info .btn .cart{width: 150px; height: 50px; background: none; margin: 20px 10px 0 0; border: 2px solid gray; color: gray;}
        #onelist_wrap .bar{margin: 100px auto; border-bottom: 1px solid black; text-align: center; width: 800px;}
        #onelist_wrap .bar p{display: inline-block; margin: 20px 30px;}
        #onelist_wrap .contents{font-size: 0.8em; text-align: center;}
        #onelist_wrap .contents .notice, #onelist_wrap .contents .delivery{color: #cf0000;font-weight: bold; text-decoration: underline; font-size: 1.2em;}
        #onelist_wrap .count{border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; margin-top: 50px;}
        #onelist_wrap .count{padding: 0;}
        #onelist_wrap .count input[type=button]{font-size: bold; color: lightgray; background: none;}
        #onelist_wrap .count input[type=button]:first-child{border-right: none;}
        #onelist_wrap .count input[type=button]:last-child{border-left: none;}
        #onelist_wrap .count input[type=text]{height: 31px; margin:0 -5px;}
        #onelist_wrap .count input{width: 35px; height: 35px; border: 1px solid lightgray; font-size: 1.5em; text-align: center;}
        #onelist_wrap .count .top p{display: inline-block;}
        #onelist_wrap .count .bottom p{display: inline-block;}
        #onelist_wrap .count .bottom p:nth-child(2){float: right;}
        #onelist_wrap .count_wrap{display: none;}
        #onelist_wrap .count #cnt{background: none;}
        #onelist_wrap .count .colorinput{font-size: 1.1em;}
        #onelist_wrap #productprice{width:70px; border: none; font-size: 1em; background: none;}
        #onelist_wrap .btn .purchase:hover{background: black; color: white; border: 2px solid black;}
        #onelist_wrap .btn .cart:hover{background: gray; color: white;}
        #onelist_wrap .totprice{text-align: right;}
       	#onelist_wrap select{outline:none;}
    </style>
</head>
<body>
    <div id="onelist_wrap">
        <div class="oneimg"><img src="img/${p_img }" alt="product"></div>
        <div class="info">
        <form action="OrderOne.do" method="post" name="OnelistForm">
            <h1>${p_name }</h1>
            <p><span class="price"><fmt:formatNumber value="${p_price }" pattern="#,###" /></span>원</p>
            <b class="delivery1">배송비</b>
            <p class="delivery2">3,000원 (50,000원 이상 구매 시 무료)<br>제주 및 도서 산간 2,500원 무료</p>
            <!--JSTL선택할 사항이 있을 경우-->
            <c:if test="${null ne p_colorone }">
            	<p class="choose">CHOOSE !</p>
	            <select name="color" onchange="colorf()" id="color">	
	                <option value="option">선택하세요</option>
	                <option value="RED">RED</option>
	                <option value="YELLOW">YELLOW</option>
	            </select>
	        </c:if>
	        <c:if test="${empty p_colorone }"> <!-- 색상 선택이 없는 경우 CHOOSE!대신 수량이 뜨도록 -->
	        	<p class="choose">수량</p>
	        </c:if>
            <div class="count_wrap">
                <div class="count">
                    <div class="top">
                        <p class="colorinput" id="colorinput"></p>
                    </div>
                    <div class="bottom">
                        <p>
                            <input type="button" value="-" onclick="minus()">
                            <input type="text" name="cnt" id="cnt" readonly="readonly">
                            <input type="button" value="+" onclick="pluss()">
                        </p>
                        <p><input type="text" name="productprice" id="productprice" readonly="readonly">원</p>
                    </div>
                </div>
                <p class="totprice"><span class="totalprice" name="totalprice"></span><span>원</span></p>
                <c:if test="${empty p_colorone }"> <!-- // 색상 선택이 없는 경우 -->
		            <script>
		            	var cntinput = document.getElementById("cnt"); // -와 +버튼 사이 구매수량 들어갈 곳
		            	var price = document.getElementsByClassName("price")[0]; // 상품 단가
		                var colorinput = document.getElementById("colorinput");
		                var count_wrap = document.getElementsByClassName("count_wrap")[0]; // 수량,금액관련 나오는 곳 전부
		                var totalpriceinput = document.getElementsByClassName("totalprice")[0]; // 총합계 들어갈 곳
		                var productprice = document.getElementById("productprice"); // 상품별 합계
		                
			            function colorf2(){ // 색상선택이 없는 경우
	                        colorinput.style.display = "none";
	                        count_wrap.style.display = "block";
	                        cntinput.value = 1;
	                        productprice.value = price.innerHTML;
	                        totalpriceinput.innerHTML = price.innerHTML; // 총합계 금액에 초기 단가 넣기
		                }
		                
			            colorf2();
		            </script>	
		            <input type="hidden" name="color" value="ncolor">	            
	        	</c:if>
            </div>
            <input type="hidden" name="p_no" value="${p_no }">
            <input type="hidden" name="p_img" value="${p_img }">
           	<input type="hidden" name="p_name" value="${p_name }">
            <p class="btn">
                <input class="purchase" type="submit" value="구매하기">
               	<input class="cart" type="submit" value="장바구니에 담기" formaction="Cart.do">
            </p>
            </form>
        </div>
        <div class="bar">
            <p>NOTICE</p>
        </div>
        <div class="contents">
            <p class="notice">NOTICE</p>
            <p>∙ 모니터의 사양에 따라 색상의 차이가 있을 수 있습니다.</p>
            <p>∙  인쇄 제품의 경우, 공정상 색감의 차이가 생길 수 있습니다.</p>
            <p>
                ∙ 주문서 내용 변경이 필요하신 경우 취소 후 재 구매 부탁드립니다.<br><br>
                <b>( 입금하신 후 변경/취소를 원하시는 경우 꼭 ! Q & A 게시판에 남겨주세요. )</b>
            </p>
            <p>
                ∙ <b>48</b>시간 내 미입금시 주문이 취소됩니다.<br><br>
                                무통장 입금이 확인 되면 "결제완료"로 주문 상태가 변경됩니다.<br><br>
				입금 확인은 12시간 내 처리됩니다.<br><br>
                ( 수동처리로 바로 확인이 되지 않는 점 양해부탁드립니다.<br><br>
				배송 순번은 주문 시각으로 처리됩니다 ! )    
            </p>
            <p>∙ 배송 준비중인 상태에서는 이미 운송장 출력후 출고 대기중이라,<br><br>
                취소가 어렵습니다. 이 경우 취소시 왕복 배송비를 지불해주셔야 합니다.</p>
            <p>
                <b>∙ 교환/환불에 따른 요청은 상품 수령후 3일 이내에<br><br>
                Q & A 게시판에 남겨주셔야 처리가 가능합니다.</b>
            </p>
            <p>∙  상품 포장도 상품의 일부입니다. 상품 포장지를 훼손시 반품이 어려울 수 있습니다.</p>
            <p class="delivery">DELIVERY</p>
            <p>∙ 배송비는 3000원이며, 50,000원 이상 구매시 무료배송입니다.</p>
            <p>∙ 발송 날짜는 구매 기간마다 사이트에 띄우는 팝업창을 참고해주세요.</p>
            <p>∙ 배송 준비기간은 1-3일(영업일 기준) 정도 소요됩니다.</p>
            <p>∙ 택배사는 CJ대한통운이며, 발송 후 영업일 기준 배송완료까지 1~3일 소요됩니다.</p>
            <p>∙ 산간지역 / 제주지역은 추가금액을 지불해주셔야 합니다.</p>
        </div>
    </div>
    
    <script>
        var cntinput = document.getElementById("cnt"); // -와 +버튼 사이 구매수량 들어갈 곳
        var price = document.getElementsByClassName("price")[0]; // 상품 단가
        var cnt = 1;
        var count_wrap = document.getElementsByClassName("count_wrap")[0]; // 수량,금액관련 나오는 곳 전부
        var totalpriceinput = document.getElementsByClassName("totalprice")[0]; // 총합계 들어갈 곳
        var total = 0;
        var productprice = document.getElementById("productprice"); // 상품별 합계
        
		function colorf(){ // 색상선택이 있는 경우
	    	
			cntinput = document.getElementById("cnt"); // -와 +버튼 사이 구매수량 들어갈 곳
			cnt = 1;
			productprice = document.getElementById("productprice"); // 상품별 합계
	    	color = document.getElementById("color"); // select 부분
		    colorinput = document.getElementById("colorinput"); // 색상 선택했을 때 그 값  들어갈 부분
		    		    
	        var c = color.options[color.selectedIndex].value; // select에서 선택한 option값 받아오기
	        colorinput.innerHTML = c; // 받아온 색상 넣기
	        count_wrap.style.display = "block";
	        
	        cntinput.value = 1; // 수량에 초기값 1 넣기
	        productprice.value = price.innerHTML; // 상품별 합계 금액에 초기 단가 넣기
	        totalpriceinput.innerHTML = price.innerHTML; // 총합계 금액에 초기 단가 넣기

          	// '선택하세요'를 선택했을 경우
   			if(c=="option"){ // 색상 선택 안함
   				count_wrap.style.display = "none";
   			}
		
	    }
        
        function removecomma(num){
            
            return parseInt(num.replace(/,/g,""));
        }
        
        function minus(){
            if(cnt>1){
                cnt += -1;
                cntinput.value = cnt;
                var cal = removecomma(productprice.value) - removecomma(price.innerHTML);
                productprice.value = cal.toLocaleString();
                totalpriceinput.innerHTML = cal.toLocaleString();
                
            }else if(cnt==1){
                del();         
            }
        }
    
        function pluss(){
            cnt += 1;
            cntinput.value = cnt;
            cal = (removecomma(price.innerHTML) * cnt);
            productprice.value = cal.toLocaleString();
            totalpriceinput.innerHTML = cal.toLocaleString();
        }
       
		window.onload = function(){ // 윈도우 창 시작하자마자
			document.getElementById("color").value = "option";
			document.getElementById("color").onchange();
		}
        
    </script>
</body>
</html>