<%@page import="fooding.FoodingDAO"%>
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
     request.setCharacterEncoding("UTF-8");
  %>
     <jsp:useBean id="fdbean" class="fooding.FoodingBoardBean">
        <jsp:setProperty name="fdbean" property="*" />
     </jsp:useBean>
  
  <%
     FoodingDAO fdao = new FoodingDAO();
     
    if(fdbean.getSubject() != null){
    	fdao.reWriteFooding(fdbean);
    } 
     response.sendRedirect("Main02.jsp?section=FoodingBoardList.jsp");
   
  %>
</body>
</html>