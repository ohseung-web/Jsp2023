<%@page import="db.RentCarDAO"%>
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
    String userid = request.getParameter("id");
    String userpw = request.getParameter("pw");
    
    //회원 id와 pw일치하는지 비교
    RentCarDAO rdao = new RentCarDAO();
    //해당 회원이 존재하는지 여부를 숫자로 표현
    int result = rdao.getMember(userid, userpw);
    
    if(result == 0){
  %>  	
    <script type="text/javascript">
        alert("회원 아이디 또는 비밀번호가 틀립니다.");
        location.href='RentcarMain.jsp?section=MemberLogin.jsp';
     </script>
 <%    
    }else{
      // 로그인처리가 되었다면
      session.setAttribute("id", userid);
      response.sendRedirect("RentcarMain.jsp");
 %>
 <%   	
    }
%>
</body>
</html>