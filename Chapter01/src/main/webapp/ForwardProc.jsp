<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
       int age = Integer.parseInt(request.getParameter("age"));
       // forward
       // 기존의 request를 그대로 다시 사용한다.
       // 즉, 기존에 전달된 age가 다시 이동하려는 경로로 전달된다.
       
       if(age >= 20){
    	   request.getRequestDispatcher("adult.jsp").forward(request, response);
       }else {
    	   request.getRequestDispatcher("child.jsp").forward(request, response);
       }
   %>
</body>
</html>

