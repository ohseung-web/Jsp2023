
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>오늘 날짜와 현재시간 출력</h2>
<hr>
<%
   Date today = new Date();
   int year = today.getYear()+1900;
   int month = today.getMonth()+1;
   int day = today.getDate();
   
   int hour = today.getHours();
   int minute = today.getMinutes();
   int second = today.getSeconds();
%>
   오늘날짜 :  <%= year %>년&nbsp; <%= month%>월&nbsp; <%= day %>일<br>
   현재시간 :  <%= hour %>시&nbsp; <%= minute%>분&nbsp; <%= second %>초
</body>
</html>