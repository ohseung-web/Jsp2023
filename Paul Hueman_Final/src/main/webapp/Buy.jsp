<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/Buy.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<title>구매창</title>
</head>
<body>
	<div class="wrap">
		<h2 align="center">ORDER LIST</h2><br>
		<c:choose>
			<c:when test="${not empty orderlist}">
				<c:forEach var="order" items="${orderlist}">
					<ul class="smallwrap">
						<li class="li_contentsMark"><h3 class="li_title">주문 번호</h3> <strong>${order.o_no}</strong>
						</li>
						<li class="li_contents"><h3 class="li_title">주문일자</h3>
                     		20${fn:substring(order.o_no,0,2)}년
                     		${fn:substring(order.o_no,2,4)}월
                     		${fn:substring(order.o_no,4,6)}일
                     	</li>
						<li class="li_contents"><h3 class="li_title">주문자</h3>
							${order.o_name}</li>
						<li class="li_contents"><h3 class="li_title">배송주소</h3>
							${order.o_addr}</li>
						<li class="li_contents"><h3 class="li_title">전화번호</h3>
							${order.o_tel}</li>
						<li class="li_line"><hr></li>
						<c:forEach var="product" items="${productlist}">
							<c:if test="${order.o_no == product.o_no}">
								<ul class="ul_of_cart">
									<li class="li_img"><img class="cartproduct_img"
										src="img/product/${product.op_name}/${product.op_color}/list1.jpg"
										alt="이미지"></li>
									<li class="li_namePrice"><strong>${product.op_name}</strong>
										<br>${product.op_color}</li>
									<li class="li_count"><strong>${product.op_cnt}&nbsp;EA</strong></li>
									<li class="li_sum"><strong><fmt:formatNumber
												value="${product.op_sum}" /></strong></li>
								</ul>
							</c:if>
						</c:forEach>
						<li class="li_totalSum"><strong>총금액 &nbsp;:&nbsp; <fmt:formatNumber
									value="${order.o_total}" /></strong></li>
					</ul>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="nullalert">주문 내역이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		<div class="btn_con">
			<input type="button" onclick="back()" value="돌아가기" id="backbtn">
		</div>
	</div>
	<script>function back(){location.href = "Main.jsp";}</script>
</body>
</html>