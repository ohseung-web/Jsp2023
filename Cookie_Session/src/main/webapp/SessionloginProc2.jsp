<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
  <div class="container">
   <h2> 세션 로그인 처리2</h2>
   

    <%
        // 세션을 이용하여 데이터를 불어온다.
        String id = (String)session.getAttribute("id");
        String pw = (String)session.getAttribute("pw");
    %>
    
         <h2> 당신의 아이디는 <%=id %>이고, 패스워드는 <%=pw %>입니다. </h2>
  </div>  
</body>
</html>