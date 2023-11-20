<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Cart.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Paul Hueman</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<form class="wrap" id="order">
		<h2 align="center">ORDER SHEET</h2><br>
		<h3>ITEMS</h3><hr>
		<c:forEach var="pdto" items="${orderlist}">
			<ul class="ul_of_order">
				<li class="li_img"><img class="cartproduct_img" src="img/product/${pdto.p_name}/${pdto.p_color}/list1.jpg" alt="이미지"></li>
				<li class="li_desc">
					<input type="hidden" name="no" value="${pdto.c_no}">
					<input type="hidden" name="itemName" value="${pdto.p_name}">
					<input type="hidden" name="color" value="${pdto.p_color}">
					<input type="hidden" name="price" value="${pdto.p_price}">
					<input type="hidden" name="cnt" value="${pdto.c_cnt}">
					<input type="hidden" name="sum" value="${pdto.c_cnt * pdto.p_price}">
					<strong>${pdto.p_name}</strong>
					<br>${pdto.p_color}
				</li>
				<li class="li_ordercount">${pdto.c_cnt}EA</li>
				<li class="li_price"></li>
			</ul>
		</c:forEach>
		<p class="total_para"><label class="label_total">Total</label><span class="total_number"></span></p>
		<h3 class="tablename"><label class="label_shipping">SHIPPING</label><span class="order_userinfo">회원정보 가져오기</span><input type="checkbox" id="usercheck" onclick="setUserinfo()"></h3>
		<table id="order_shipping">
			<tr>
				<td><label class="label_td" for="order_name">이름</label></td>
				<td><input type="text" name="userName" id="order_name" required>
			</tr>
			<tr>
				<td><label class="label_td">주소</label></td>
				<td>
					<span class="addrflex"><input type="text" name="zipcode" id="order_zipcode" maxlength="6" oninput="chkNum()" required><input type="button" value="주소 검색" id="addrSearch" onclick="getAddress()"></span><br>
					<input type="text" name="roadAddr" id="order_roadAddr" required><br>
					<input type="text" name="detailAddr" id="order_detailAddr"><br>
					<input type="text" name="extraAddr" id="order_extraAddr" readonly>
				</td>
			</tr>
			<tr>
				<td><label class="label_td">전화번호</label></td>
				<td><input type="text" name="tel" id="order_tel" required></td>
			</tr>
		</table>
		<h3 class="tablename">PAYMENT</h3>
		<table id="order_payment">
			<tr>
				<td><label class="label_td">TOTAL COST</label></td><td><span class="payment_number"></span></td>
			</tr>
			<tr>
				<td><label class="label_td">PAY METHOD</label></td>
				<td>
					<h4>무통장입금</h4>
					<p><label class="label_innertd">입금할 계좌</label>KB국민은행 680201-04-046805 (주)반도옵티칼</p>
					<p><label class="label_innertd">입금자명</label><input type="text" name="payer" id="order_payer" value="${user.u_name}"></p>
				</td>
			</tr>
		</table>
		<input type="hidden" name="total" value="0">
		<input type="button" value="주문하기" class="smt" onclick="order()">
	</form>
	<script type="text/javascript" src="js/Order.js"></script>
	<script type="text/javascript">
		setPage();
		name = "${user.u_name}";
		zip = "${user.u_zipcode}";
		ra = "${user.u_roadaddr}";
		da = "${user.u_detailaddr}";
		ea  = "${user.u_extraaddr}";
		tel = "${user.u_tel}";
	</script>
</body>
</html>