<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  ul{
   display: inline-block;
   padding: 30px;
    padding-left: 60px;
  }
  ul,li{
  list-style: none;
  }
  li{
  padding-right: 60px;
  padding-left: 60px;
  }
 
</style>
</head>
<body>
<center>
<br>
<input type="button" value="장바구니 가기" onclick="location.href='JangList.do'">
<h1>상품 페이지</h1>
<c:forEach var="pro" items="${a }">
<ul>
<li><a href="ProInfo.do?num=${pro.pro_no }">${pro.img }</a></li>
<li>${pro.name }</li>
<li>${pro.price }원</li>
</ul>

</c:forEach>
</center>
</body>
</html>