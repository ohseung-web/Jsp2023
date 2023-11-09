<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- RequestLogin에서 넘어온 id, pw를 읽어들인다. -->
<!-- Request 객체 : 웹 브라우저의 요청 정보를 저장하고 있는 객체  -->
<!-- Request 객체의 범위는 다음페이지 까지이다. -->

<%
    /* 사용자의 정보가 저장되어있는 객체 request의 getParameter( ) 사용자의 정보 추출 */
    String id = request.getParameter("id");
    String pw = request.getParameter("pw"); 
%>
  <h2>
  당신의 아이디는 <%= id %>이고, 패스워드 <%=pw %>입니다.
  </h2>
  
  <a href="RequestForward.jsp">다음페이지</a>
</body>
</html>

