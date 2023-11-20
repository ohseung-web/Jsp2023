<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paul Hueman</title>
<link rel="stylesheet" href="css/Item.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<div id="itemlist" class="section">
		<nav>
			<dl>
				<dt>SHOP</dt>
				<dd><a href="ItemList.do?cate=2">SUNGLASSES</a></dd>
				<dd><a href="ItemList.do?cate=1">GLASSES</a></dd>
			</dl>
        </nav>
		<div id="item_con">
			<c:forEach var="pdto" items="${list}">
			<div class="items">
            	<div class="slide_view">
					<div class="slide_con">
						<a href="Item.do?code=${pdto.p_code}&color=3" class="slide_items">
							<img src="img/product/${pdto.p_name}/${pdto.p_color3}/list1.jpg" alt="색상3">
						</a>
						<a href="Item.do?code=${pdto.p_code}&color=1" class="slide_items">
							<img src="img/product/${pdto.p_name}/${pdto.p_color1}/list1.jpg" alt="색상1">
						</a>
						<a href="Item.do?code=${pdto.p_code}&color=2" class="slide_items">
							<img src="img/product/${pdto.p_name}/${pdto.p_color2}/list1.jpg" alt="색상2">
						</a>
					</div>
                </div>
                <div class="item_summery">
					<button class="color_btn" onclick="slideLeft()">&lt;</button>
					<p>3COLORS<br>${pdto.p_name}</p>
					<button class="color_btn" onclick="slideRight()">&gt;</button>
				</div>
				<p><fmt:formatNumber value="${pdto.p_price}"/> won</p>
			</div>
			</c:forEach>
		</div>
	</div>
	<script src="js/ItemList.js"></script>
	<script>
		cate = parseInt("${cate}");
		setPage();
	</script>
</body>
</html>