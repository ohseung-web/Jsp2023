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
     
     /* session.setAttribute("id1", id);
     session.setAttribute("pw1", pw);
     session.setAttribute("name1", name); */
     
     /* forward는 id, pw, name를 가지고 termsYes.jsp로 넘어가기 때문에 session을 사용 할 필요가 없다. */
     
     if(agree.equals("yes")){
    	 request.getRequestDispatcher("TermsYes.jsp").forward(request, response);
     }else {
    	 request.getRequestDispatcher("TermsNO.jsp").forward(request, response);
     }

%>
    

</body>
</html>