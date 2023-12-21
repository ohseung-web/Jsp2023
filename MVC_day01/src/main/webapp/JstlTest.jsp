<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <!-- 변수선언 하는 방법 var="i"는 변수 i를 의미한다.-->
<c:set var="i" value="4"/>
<%
    request.setAttribute("i", 4);
%>

<!-- if문 사용 방법 -->
<c:if test="${ i > 3 }"> 
안녕하세요 <br>
</c:if> --%>

<c:set var="sum" value="0"/>
<!-- 반복문 for -->
<c:forEach var="i" begin="1" end="10" step="${ i = i + 2 }" >
   <c:set var="sum" value="${sum = sum + i}"/>
</c:forEach>
 ${sum}
 
 
 
</body>
</html>