<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h2> ResponseRedirect.jsp 페이지 입니다. </h2>
   <%
       request.setCharacterEncoding("UTF-8");
       
       String id = request.getParameter("id");
       
   %>
   
       <h3>아이디 : <%=id %></h3>
       

</body>
</html>