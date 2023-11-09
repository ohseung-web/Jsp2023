<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>체크박스 10개 생성</h2>
<hr>
<br/> 1st
<%
   for(int i=0; i<10; i++){
%>
   <input type="checkbox">   	   
<% } %>   

<br/> 2nd
<%
    for(int i=0; i<10; i++){
    	out.print("<input type='checkbox'>");
    }
%>
</body>
</html>