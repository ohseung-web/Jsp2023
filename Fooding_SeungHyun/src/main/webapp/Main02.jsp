<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

   <%
     // section 값을 변경해주기위해 request값을 받아온다.
     String section = request.getParameter("section");
 
      // 처음 SessionMain.jsp를 실행하면 null값이 실행되기에 null처리한다.
      if(section == null){
    	  section = "Section02.jsp";
      }
 
 %>
      <jsp:include page="Header02.jsp" />
      <section>
        <jsp:include page="<%=section %>" />
      </section>
      <jsp:include page="Footer02.jsp" />

</body>
</html>