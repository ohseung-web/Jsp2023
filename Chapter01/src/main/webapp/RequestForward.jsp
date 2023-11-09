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
    /* 사용자의 정보가 저장되어있는 객체 request의 getParameter( ) 사용자의 정보 추출 */
    String id = request.getParameter("id");
    String pw = request.getParameter("pw"); 
%>
  <h2>
  RequestForward.jsp 페이지 입니다.<br>
  당신의 아이디는 <%= id %>이고, 패스워드 <%=pw %>입니다.
  </h2>
</body>
</html>

