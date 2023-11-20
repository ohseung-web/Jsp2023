<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paul Hueman</title>
<link rel="stylesheet" href="css/Header.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&family=Maven+Pro:wght@400;500;600;700
	&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div id="top">
        <div class="left">
        <!-- 로그인 상태 : 회원아이디, 로그아웃 버튼  //  로그아웃 상태 : 로그인버튼, 회원가입 버튼 -->
        	<c:choose>
        		<c:when test="${null ne paul_login }">
            		<span class="userlogin"><a href="LoginOK.do">${paul_login }님</a></span>
        			<span class="login"><a href="LogoutProc.do">LOGOUT</a></span>
        		</c:when>
        		<c:otherwise>
        			<span class="login"><a href="Main.jsp?section=Login.jsp">LOGIN</a></span>
            		<span class="login"><a href="Main.jsp?section=Join.jsp">회원가입</a></span>
        		</c:otherwise>
        	</c:choose>
        </div>
    </div>
    <div id="logo"><a href="Main.jsp"><img src="img/logo.png" alt="로고"></a></div>
    <nav>
        <ul>
            <li class="shop"><a href="#">SHOP</a>
                <ul class="submenu">
                    <li><a href="ItemList.do?cate=2">SUNGLASSES</a></li>
                    <li><a href="ItemList.do?cate=1">GLASSES</a></li>
                </ul>  
            </li>
            <li><a href="CartList.do">CART</a></li>
            <li class="mypage">MY PAGE
            	<ul class="submenu2">
                    <li><a href="LoginOK.do">USER MODIFY</a></li>
                    <li><a href="Buy.do">ORDER LIST</a></li>
                </ul> 
            </li>
            <li><a href="BoardListProc.do">BOARD</a></li>
        </ul>
    </nav>
</header>
</body>
</html>