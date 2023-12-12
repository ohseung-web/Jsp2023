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
     String id = (String)session.getAttribute("id");
      
      session.setAttribute("id", null);
      session.setMaxInactiveInterval(0);
      
      response.sendRedirect("RentcarMain.jsp");
 %>
 
</body>
</html>