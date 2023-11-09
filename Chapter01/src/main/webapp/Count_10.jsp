
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
  <h1>1부터 10까지 출력</h1>

<%
   //1~10까지의 숫자를 화면에 출력하시오.
   for(int i=1; i<=10; i++){
	 out.println(i);
%>    
    <br>
<% 
} 
%>    

</body>
</html>