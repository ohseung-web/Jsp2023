<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	.buywrap { width: 1400px; height: 1800px; margin: 0 auto; }
	.buywrap h2 { width: 100%; padding-left: 25px; }
	.buywrap p { margin-bottom: 25px; }
	.buywrap .buylist { width: 1350px; height: 640px; margin: 50px auto; }
	.buywrap .buylist .free { width: 100%; margin: 5px 0; }
    .buywrap .buylist table { width: 100%; border-collapse: collapse; }
    .buywrap .buylist table th { height: 45px; background-color: #fbfbfb; border-top: 1px solid black; font-size: 1.1em; border-bottom: 1px solid lightgray; }
    .buywrap .buylist table th:nth-child(1) { width: 1050px; }
    .buywrap .buylist table th:nth-child(2) { width: 150px; }
    .buywrap .buylist table th:nth-child(3) { width: 200px; }
    .buywrap .buylist table td { height: 45px; border-bottom: 1px solid lightgray; text-align: center; }
    .buywrap .buylist table td .cartlistcntbtn { text-align: center; }
    .buywrap .buylist table td .cartlistcntbtn #cntnum { border: none; outline: none; width: 90px; height: 35px; display: inline-block; font-size: 16px; text-align: center; line-height: 26px; background-color: white; }
    .buywrap .buylist table tr:last-child td { border-bottom: none; height: 100px; }
    .buywrap .buylist table .trheight { height: 150px; }
    .buywrap .buylist table .trheight a { text-decoration: none; color: black; }
    .buywrap .buylist table tr td:nth-child(1) img { width: 110px; height: 110px;`}
    .buywrap .buylist table tr td:nth-child(1) { width: 110px; }
    .buywrap .buylist table tr td:nth-child(2) { width: 940px; text-align: left; padding-left: 30px; }
    .buywrap .buylist table tr td .pinfo { margin: 0; }
    .buywrap .buylist table tr td .pinfo .pinfobtn { padding: 0; border: none; outline: none; background: none; cursor: pointer; }
    .buywrap .buylist table tr td .pinfo span { font-size: 14px; }
    .buywrap .buylist table tr td .cntprice { border: none; outline: none; width: 140px; height: 35px; text-align: right; font-size: 16px; line-height: 35px; }
    .buywrap .buylist table tr .contentnone { border-bottom: none; }
    .buywrap .buylist table tr .contentnone:nth-child(1) { width: 110px; }
    .buywrap .buylist table tr .contentnone:nth-child(2) { width: 590px; }
    .buywrap .buylist table tr .buycontent { text-align: right; border-bottom: none; }
    .buywrap .buylist table tr #buydelivery { text-align: right; border-bottom: 1px solid lightgray; }
    .buywrap .buylist .buyerinfowrap { display: flex; width: 1450px; margin: 0 auto; }
    .buywrap .buylist .buyerinfowrap .buyerwrap, .buyerinfowrap .deliverywrap { width: 725px; padding-left: 100px; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput p, .deliverywrap .deliveryinput p { font-size: 14px; margin: 15px 0; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput input, .deliverywrap .deliveryinput input { width: 500px; height: 40px; border: 1px solid #ccc; outline: none; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput .phone, .deliverywrap .deliveryinput .phone { width: 150px; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput .zipcode, .deliverywrap .deliveryinput .zipcode { width: 343px; outline: none; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput .zipcodebtn, .deliverywrap .deliveryinput .zipcodebtn { width: 150px; height: 44px; border: 2px solid gray; color: gray; background: white; vertical-align: middle; cursor: pointer; outline: none; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput .zipcodebtn:hover, .deliverywrap .deliveryinput .zipcodebtn:hover { background: gray; color: white; }
    .buywrap .buylist .buyerinfowrap .buyerwrap .buyerinput .address, .deliverywrap .deliveryinput .address { margin: 0 0 10px 0; outline: none; }
    .buywrap .buylist #buycontent { text-align: center; margin: 50px auto;}
    .buywrap .buylist #buycontent input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    .buywrap .buylist #buycontent input:hover { background: black; color: white; }
</style>
</head>
<body>
	<div class="buywrap">
 		<h2>주문 / 결제</h2>
		<div class="buylist">
 			<form action="Buy.do" method="post">
 				<p class="free"> &lowast; 50,000원 이상 구매 시 배송비 무료</p>
 				<table>
 					<tr>
 						<th colspan="4">상품정보</th>
 						<th>수량</th>
 						<th>가격</th>
		            </tr>
		            <c:forEach var="tdto" items="${al }">
		            	<tr class="trheight">
		            		<td>
		            			<a href="ProductDetail.do?p_no=${tdto.c_no }"><img alt="image" src="img/${tdto.c_img}"></a>
		            			<input type="hidden" name="img" value="${tdto.c_img}">
		            		</td>
		            		<td colspan="3">
								<p class="pinfo">
									<a href="ProductDetail.do?p_no=${tdto.c_no }">${tdto.c_name}</a>
									<input type="hidden" name="name" value="${tdto.c_name}">
								</p>
								<c:choose>
						       		<c:when test="${tdto.c_color == 'ncolor' }">
						       			<p class="pinfo">
						       				<small>CHOOSE &#33; &#58;</small> <span>색상없음</span>
						       				<input type="hidden" name="color" value="${tdto.c_color}">
						       			</p>
						       		</c:when>
						       		<c:otherwise>
						       			<p class="pinfo">
						       				<small>CHOOSE &#33; &#58;</small> <span>${tdto.c_color}</span>
						       				<input type="hidden" name="color" value="${tdto.c_color}">
						       			</p>
						       		</c:otherwise>
						       	</c:choose>
							</td>
		                    <td>
		                    	<div class="cartlistcntbtn">
	                    			<input id="no" type="hidden" name="no" value="${tdto.c_no }">
	                    			<input id="cntnum" type="text" name="cntnum" value="${tdto.c_cnt}개" readonly="readonly">
	                    			<input type="hidden" name="cnt" value="${tdto.c_cnt}">
		                        </div>
		                    </td>
		                    <td>
		                    	<fmt:formatNumber value="${tdto.c_price}" />원
		                    	<input type="hidden" name="price" value="${tdto.c_price}">
		                    </td>
		                </tr>
		            </c:forEach>
		            <tr>
		            	<td class="contentnone">&nbsp;</td>
		            	<td class="contentnone">&nbsp;</td>
		            	<td class="buycontent" colspan="3">상품 합계</td>
		            	<td class="buycontent"><fmt:formatNumber value="${sum_price }" />원</td>
		            </tr>
		            <tr>
		            	<td class="contentnone">&nbsp;</td>
		            	<td class="contentnone">&nbsp;</td>
		            	<td id="buydelivery" colspan="3">배송비</td>
		            	<c:choose>
		            		<c:when test="${sum_price >= 50000 }">
		            			<td id="buydelivery">0원</td>
		            		</c:when>
		            		<c:otherwise>
		            			<td id="buydelivery">3,000원</td>
		            		</c:otherwise>
		            	</c:choose>
		            </tr>
		            <tr>
		            	<td class="contentnone">&nbsp;</td>
		            	<td class="contentnone">&nbsp;</td>
		            	<td class="buycontent" colspan="3">합계</td>
		            	<c:choose>
		            		<c:when test="${sum_price >= 50000 }">
		            			<td class="buycontent">
		            				<fmt:formatNumber value="${sum_price }" />원
		            				<input type="hidden" name="sumprice" value="${sum_price}">
		            			</td>
		            		</c:when>
		            		<c:otherwise>
		            			<td class="buycontent">
		            				<fmt:formatNumber value="${sum_price + 3000}" />원
		            				<input type="hidden" name="sumprice" value="${sum_price + 3000}">
		            			</td>
		            		</c:otherwise>
		            	</c:choose>
		            </tr>
		        </table>
		        <div class="buyerinfowrap">
		        	<div class="buyerwrap">
		                <p class="buyer">주문자 정보</p>
		                <div class="buyerinput">
		                    <p>이름</p>
		                    <input type="text" name="buyername" value="${name }" id="buyername" readonly="readonly">
		                    <p>우편번호</p>
		                    <input class="zipcode" type="text" name="buyerzipcode" id="buyerzipcode" value="${zipcode }" readonly="readonly">
		                    <input class="zipcodebtn" type="button" value="검색하기" onclick="buyerpostcode()">
		                    <p>주소</p>
		                    <input class="address" type="text" name="buyeraddress1" id="buyerroadaddress" value="${roadaddress }" readonly="readonly">
		                    <input class="address" type="text" name="buyeraddress2" id="buyerdetailAddress" value="${detailaddress }">
		                    <p>연락처</p>
		                    <c:set var="phonevalue" value="${phone }"/>
		                    <input class="phone" type="text" name="buyerphone1" value="${fn:substring(phonevalue,0,3)}" id="buyerphone1"> -
		                    <input class="phone" type="text" name="buyerphone2" value="${fn:substring(phonevalue,4,8)}" id="buyerphone2"> -
		                    <input class="phone" type="text" name="buyerphone3" value="${fn:substring(phonevalue,9,13)}" id="buyerphone3">
		                    <p>이메일</p>
		                    <input type="text" name="buyeremail" value="${email }" readonly="readonly">
		                </div>
		        	</div>
		        	<div class="deliverywrap">
		                <p class="deliveryp1">
		                	배송지 정보
		                	<input type="checkbox" name="copy" onclick="copyinfo(this.form);"> 주문자 정보와 동일합니다.
		                </p>
		                <div class="deliveryinput">
		                    <p>이름</p>
		                    <input type="text" name="deliveryname" id="deliveryname">
		                    <p>우편번호</p>
		                    <input class="zipcode" type="text" name="deliveryzipcd" id="zipcd">
                    		<input class="zipcodebtn" type="button" value="검색하기" onclick="postcode()">
		                    <p>주소</p>
		                    <input class="address" type="text" name="deliveryaddress1" id="roadAddress">
                    		<input class="address" type="text" name="deliveryaddress2" id="detailAddress">
		                    <p>연락처</p>
		                    <input class="phone" type="text" name="deliveryphone1" id="phone1"> -
		                    <input class="phone" type="text" name="deliveryphone2" id="phone2"> -
		                    <input class="phone" type="text" name="deliveryphone3" id="phone3">
		                    <p>배송 시 요청사항</p>
		                    <input type="text" name="deliveryrequest">
		                </div>
		        	</div>
		        </div>
		        <div id="buycontent">
	            	<input type="submit" value="구매하기">
	            </div>
 			</form>
	    </div>
 	</div>
 	<script type="text/javascript">
 		var name = "";
 		var zipcode = "";
 		var roadaddress = "";
 		var detailaddress = "";
 		var phone1 = "";
 		var phone2 = "";
 		var phone3 = "";
 		var request = "";
 		
 		function copyinfo(frm) {
 			if(frm.copy.checked){
 				document.getElementById("deliveryname").value = document.getElementById("buyername").value;
 				document.getElementById("zipcd").value = document.getElementById("buyerzipcode").value;
 				document.getElementById("roadAddress").value = document.getElementById("buyerroadaddress").value;
 				document.getElementById("detailAddress").value = document.getElementById("buyerdetailAddress").value;
 				document.getElementById("phone1").value = document.getElementById("buyerphone1").value;
 				document.getElementById("phone2").value = document.getElementById("buyerphone2").value;
 				document.getElementById("phone3").value = document.getElementById("buyerphone3").value;

 			}else{
 				frm.deliveryname.value = name;
 				frm.zipcd.value = zipcode;
 				frm.roadAddress.value = roadaddress;
 				frm.detailAddress.value = detailaddress;
 				frm.phone1.value = phone1;
 				frm.phone2.value = phone2;
 				frm.phone3.value = phone3;

 			}
 		}
 		
 		function buyerpostcode() {
 			new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                // 상단에 작성된 id 값(변경 가능함)
	                // 다른 곳에서도 사용 가능
	                document.getElementById('buyerzipcode').value = data.zonecode;
	                document.getElementById("buyerroadAddress").value = roadAddr;
	                document.getElementById("buyerdetailAddress").focus();
	            }
	        }).open();
 		}
 		
	 	function postcode() {
			new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                // 상단에 작성된 id 값(변경 가능함)
	                // 다른 곳에서도 사용 가능
	                document.getElementById('zipcd').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
		}
 	</script>
</body>
</html>