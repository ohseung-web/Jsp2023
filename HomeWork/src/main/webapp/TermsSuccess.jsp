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
     String agree = request.getParameter("agree");
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     String name = request.getParameter("name");
     
     session.setAttribute("id1", id);
     session.setAttribute("pw1", pw);
     session.setAttribute("name1", name);
     
     if(agree.equals("yes")){
    	 request.getRequestDispatcher("TermsYes.jsp").forward(request, response);
     }else {
    	 request.getRequestDispatcher("TermsNO.jsp").forward(request, response);
     }

%>
    

</body>
</html>