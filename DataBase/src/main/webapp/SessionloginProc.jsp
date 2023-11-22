<%@page import="model.MemberDAO"%>
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
   <h2> 세션 로그인 처리 1</h2>
   

    <%
         request.setCharacterEncoding("UTF-8");
         // 사용자로 부터 데이터를 읽어들인다.
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         
         
         
         MemberDAO mdao = new MemberDAO();
         String dbpw = mdao.getPass(id);
         
         if(dbpw.equals(pw)){
        	
        	 // 아이디와 패스워드를 저장
             session.setAttribute("id", id);
             session.setAttribute("pw", pw);
             
            // 세션의 유지시간 설정 : 60초간 유지
             session.setMaxInactiveInterval(60*2);//2분간 id유지
             response.sendRedirect("SessionMain.jsp");
         }else{ 
  %>
         <script type="text/javascript">
              alert("아이디와 패스워드를 확인하세요");
              history.go(-1)
          </script>
  <% } %>  	 

    
         <%-- <h2> 당신의 아이디는 <%=id %>이고, 패스워드는 <%=dbpw %>입니다. </h2>
         <a href="SessionloginProc2.jsp">다음페이지로 이동</a> --%>
  </div>  
</body>
</html>