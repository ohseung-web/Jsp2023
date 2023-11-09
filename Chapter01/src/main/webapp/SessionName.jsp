<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>세션 네임 페이지 입니다.</h2>
<%
   /* session.setAttribute("name1", name)타입이 Object이기때문에
      상위에서 하위로 다운 캐스팅하여야 함을 주의 하자. */
   String name1 = (String)session.getAttribute("name1");

%>

<%=name1 %>님 반갑습니다.


</body>
</html>