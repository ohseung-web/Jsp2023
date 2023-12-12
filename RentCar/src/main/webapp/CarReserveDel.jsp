<%@page import="db.RentCarDAO"%>
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
       int no =Integer.parseInt(request.getParameter("no"));
      
       RentCarDAO rdao = new RentCarDAO();
       //예약삭제 메소드 호출
       rdao.carRemoveReserve(no);
       response.sendRedirect("RentcarMain.jsp");
   %>
</body>
</html>