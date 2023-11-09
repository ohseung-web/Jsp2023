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

    String id1 = (String)session.getAttribute("id1");
    String pw1 = (String)session.getAttribute("pw1");
    String name1 = (String)session.getAttribute("name1");

%>
  <h2>가입이 완료되었습니다.</h2>
  <h2>가입정보</h2>
  <ul>
     <li>가입 아이디 :<%=id1 %> </li>
     <li>가입 비밀번호 :<%=pw1 %> </li>
     <li>가입 이름 :<%=name1 %> </li>
  </ul>
</body>
</html>