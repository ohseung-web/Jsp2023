<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#purchasewrap { width: 1400px; height: 1000px; margin: 50px auto; }
	#purchasewrap table { width: 1400px; margin: 0 auto; border-collapse: collapse; }
	#purchasewrap table tr th { height: 45px; background-color: #fbfbfb; border-top: 1px solid black; font-size: 1.1em; border-bottom: 1px solid lightgray; }
	#purchasewrap table tr td { height: 45px; text-align: center; font-size: 14px; border-bottom: 1px solid lightgray; }
	#purchasewrap table tr td:nth-child(1), td:nth-child(2) { width: 120px; }
	#purchasewrap table tr td:nth-child(3) { width: 100px; }
	#purchasewrap table tr td:nth-child(3) img { width: 80px; height: 80px; }
	#purchasewrap table tr td:nth-child(4) { width: 830px; text-align: left; }
	#purchasewrap table tr td:nth-child(5) { width: 100px; }
	#purchasewrap table tr td:nth-child(6) { width: 130px; }
	#purchasewrap .mainbtn { width: 1200px; margin: 20px auto; text-align: center; }
	#purchasewrap .mainbtn input { width: 150px; height: 50px; border: 2px solid black; color: black; background: white; font-size: 14px; cursor: pointer; outline: none; }
    #purchasewrap .mainbtn input:hover { background: black; color: white; }
</style>
</head>
<body>
	<div id="purchasewrap">
		<table>
			<tr>
				<th>구매일자</th>
				<th>구매번호</th>
				<th colspan="2">구매 상품 정보</th>
				<th>구매수량</th>
				<th>구매금액</th>
			</tr>
			<c:forEach var="tdto" items="${arl }">
				<tr>
					<td>${tdto.buy_date }</td>
					<td>${tdto.buy_num }</td>
					<td><img alt="image" src="img/${tdto.b_img}"></td>
					<c:choose>
			       		<c:when test="${tdto.b_color == 'ncolor' }">
			       			<td>
			       				${tdto.b_name } / <small>옵션 &#58; <span>색상없음</span></small>
			       			</td>
			       		</c:when>
			       		<c:otherwise>
			       			<td>
			       				${tdto.b_name } / <small>옵션 &#58; <span>${tdto.b_color}</span></small>
			       			</td>
			       		</c:otherwise>
			       	</c:choose>
					<td>${tdto.b_cnt }</td>
					<td><fmt:formatNumber value="${tdto.b_price}" />원</td>
				</tr>
			</c:forEach>
		</table>
		<div class="mainbtn">
	   		<input type="button" value="메인으로 가기" onclick="location.href='MainList.do'">
	  	</div>
	</div>
</body>
</html>