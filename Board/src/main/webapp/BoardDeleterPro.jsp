<%@page import="Model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
       
      String pass = request.getParameter("password");
       int num = Integer.parseInt(request.getParameter("num"));
       
       // 데이터베이스 연결
       BoardDAO bdao= new BoardDAO();
       String password = bdao.getPass(num);
       
       //기존 패스워드값과 deleteform 에서 작성한 패스워드를 비교한다.
       if(pass.equals(password)){
    	     
    	   //패스워드가 둘다 같다면
    	      bdao.deleteBoard(num);
    	      response.sendRedirect("BoardList.jsp");
       }else {
 %>
         <script>
             alert("패스워드가 틀려서 삭제 할 수 없습니다.")
             history.go(-1);
         </script>   	   
<%    	   
       }      
%>
</body>
</html>