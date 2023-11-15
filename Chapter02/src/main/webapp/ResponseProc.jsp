<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h2>이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>
   <%
       request.setCharacterEncoding("UTF-8");//post 방식 한글처리
       
       String id = request.getParameter("id");//request객체에 담겨진 사용자 정보를 id 추출
      // response.sendRedirect("ResponseRedirect.jsp");//흐름제어
      
   %>
       <!-- forward 액션 태그로 흐름 제어를 하면 request.getParameter("id")의 내용이 살아서
           ResponseRedirect.jsp 파일까지 넘어오기때문에 id를 추출 할 수 있다.
        --> 
       <jsp:forward page="ResponseRedirect.jsp" /><!-- 흐름 제어 -->
       
       <%-- <jsp:forward page="ResponseRedirect.jsp">
          <jsp:param value="mmmm" name="id"/>
       </jsp:forward> --%>
       
       <h3>아이디 : <%=id %></h3>
   
</body>
</html>

