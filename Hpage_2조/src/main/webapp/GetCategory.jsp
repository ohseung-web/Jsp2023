<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
        #GetCategory_wrap{width: 1400px; margin: 30px auto; padding: 0;}
        #GetCategory_wrap .product{text-align: center; display: inline-block; margin: 10px 17px;}
        #GetCategory_wrap .product img{width: 300px;}
        #GetCategory_wrap .product a{text-decoration: none;}
        #GetCategory_wrap .product a p{margin: 5px; text-align: center; color: black; font-weight: bold;}
        #GetCategory_wrap .product a .p_price{font-weight: normal;}
    </style>
</head>
<body>
	<div id="GetCategory_wrap">
		<c:forEach var="list" items="${list }">
	       	<div class="product">
	        	<a href="GetOne.do?p_no=${list.p_no }">
		        	<p><img src="img/${list.p_img }" alt="img"></p>
		        	<p class="p_name">${list.p_name }</p>
				    <p class="p_price"><fmt:formatNumber value="${list.p_price }" pattern="#,###" />원</p>
			    </a>
			</div>
	    </c:forEach>
	</div>
</body>
</html>