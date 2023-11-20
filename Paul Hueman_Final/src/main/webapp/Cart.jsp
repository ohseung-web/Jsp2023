<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Cart.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>장바구니</title>
</head>
<body>
	<div class="wrap">
		<h2 align="center">SHOPPING CART</h2><br>
		<h3>ITEMS</h3><hr>
		<c:choose>
			<c:when test="${not empty cartList}">
				<c:set var="idx" value="0"/>
				<c:forEach var="pdto" items="${cartList}">
					<form class="itemform"> 
						<ul class="ul_of_cart">
							<li class="li_check"><input type="checkbox" class="checkboxcss" checked="checked" name="checkbox_cart" value="${pdto.c_no}"></li>
							<li class="li_img"><img class="cartproduct_img" src="img/product/${pdto.p_name}/${pdto.p_color}/list1.jpg" alt="이미지"></li>
							<li class="li_desc">
								<input type="hidden" name="no" value="${pdto.c_no}">
								<input type="hidden" name="price" value="${pdto.p_price}">
								<strong>${pdto.p_name}</strong>
								<br>${pdto.p_color}
							</li>
							<li class="li_count">
								<div>
								<input type="button" class="mid_btn" value="-" 
									onclick="cntDown(${idx})"><input type="text" class="mid_input" name="cnt" value="${pdto.c_cnt}" maxlength="4" autocomplete="off" 
									oninput="cntInput()"><input type="button" class="mid_btn" value="+" onclick="cntUp(${idx})">
								</div>
								<input type="button" class="update_butt" onclick="updateCart(${idx})" value="수정">
								<input type="button" class="delete_butt" onclick="deleteCart(${idx})" value="삭제">
							</li>
							<li class="li_price"></li>
						</ul>
					</form>
					<c:set var="idx" value="${idx = idx + 1}"/>
				</c:forEach>
				<div class="caution">※ 수량변경 후 수정 버튼을 눌러 적용하시기 바랍니다.</div>
				<form id="selcart">
					<input type="button" onclick="deleteAll()" value="DELETE ALL">
					<input type="button" onclick="deleteItem()" value="DELETE ITEM">
				</form>
				<p class="total_para"><label class="label_total">Total</label><span id="total_number"></span></p>
				<form action="OrderList.do" method="post" id="cart_order">
					<input class="smt" type="button" value="주문하기" onclick="getOrder()">
				</form>
			</c:when>
			<c:otherwise>
				<div class="nullalert">장바구니가 비어있습니다.<br><input type="button" onclick="back()" value="돌아가기" id="backbtn"></div>
			</c:otherwise>
		</c:choose>
	</div>
	<script src="js/Cart.js"></script>
	<script>
		setPage();
	</script>
</body>
</html>