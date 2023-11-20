<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Item.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<title>Paul Hueman</title>
</head>
<body>
	<div id="item" class="section">
		<nav>
			<dl>
				<dt>SHOP</dt>
				<dd><a href="ItemList.do?cate=2">SUNGLASSES</a></dd>
				<dd><a href="ItemList.do?cate=1">GLASSES</a></dd>
			</dl>
		</nav>
		<div id="item_imgs">
			<img src="img/product/${pdto.p_name}/${colorName}/info1.jpg" alt="이미지1">
			<img src="img/product/${pdto.p_name}/${colorName}/info2.jpg" alt="이미지2">
			<img src="img/product/${pdto.p_name}/${colorName}/info3.jpg" alt="이미지3">
		</div>
		<form action="BuyNow.do" method="post">
			<p>${pdto.p_name}&nbsp;${colorName}</p>
			<p><span id="item_total"></span> won</p>
			<div class="cnt">
				<input type="button" value="-" onclick="cntDown()"><input type="text" name="c_cnt" id="item_cnt" maxlength="4" value="1" autocomplete="off" oninput="cntInput()"><input type="button" value="+" onclick="cntUp()">
				<img src="img/cart.png" alt="카트이미지" class="cart" onclick="addCart()">
				<img src="img/heart.png" alt="하트이미지" class="heart" onmouseover="this.src='img/redheart.png'" onmouseout="this.src='img/heart.png'" title="이스터에그">
			</div>
			<ul class="item_desc">
				<li>LENS WIDTH : ${pdto.p_width}</li>
				<li>NOSE BRIDGE : ${pdto.p_nose}</li>
				<li>FRAME SIDE : ${pdto.p_frame}</li>
				<li>MATERIAL : ${pdto.p_material}</li>
			</ul>
			<input type="button" value="BUY NOW" id="buynow" onclick="buyNow()">
			<p>COLORS</p>
			<div class="colors">
				<c:forEach var="i" begin="1" end="3">
					<c:if test="${i != color}">
						<c:choose>
							<c:when test="${i == 1}"><c:set var="colorLink" value="${pdto.p_color1}"/></c:when>
							<c:when test="${i == 2}"><c:set var="colorLink" value="${pdto.p_color2}"/></c:when>
							<c:when test="${i == 3}"><c:set var="colorLink" value="${pdto.p_color3}"/></c:when>
						</c:choose>
						<a href="Item.do?code=${pdto.p_code}&color=${i}" title="${pdto.p_name}&nbsp;${colorLink}" class="item_sidelink">
							<img src="img/product/${pdto.p_name}/${colorLink}/list1.jpg" alt="색상${i}">
						</a>
					</c:if>
				</c:forEach>
			</div>
			<input type="hidden" name="p_name" value="${pdto.p_name}">
			<input type="hidden" name="p_price" value="${pdto.p_price}">
			<input type="hidden" name="p_color" value="${colorName}">
		</form>
	</div>
	<script src="js/Item.js"></script>
	<script>
		price = parseInt("${pdto.p_price}");
		cate = parseInt("${pdto.p_cate}");
		setPage();
	</script>
	<c:if test="${paul_login != null}">
		<script>log = 1;</script>
	</c:if>
</body>
</html>