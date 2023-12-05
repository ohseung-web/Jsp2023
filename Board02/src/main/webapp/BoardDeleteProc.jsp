<%@page import="model.BoardDAO"%>
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
    String userPw = request.getParameter("password");
    int num = Integer.parseInt(request.getParameter("num"));
    
    //데이버 베이스 연결
    BoardDAO bdao = new BoardDAO();
    String dbPw = bdao.getPass(num);
    
    //DB의 패스워드와 delete Form에서 입력받은 userPw 비교
    if(dbPw.equals(userPw)){
    	bdao.deleteBoard(num);
    	response.sendRedirect("BoardList.jsp");
    }else{
%>
    <script type="text/javascript">
       alert("패스워드를 확인하세요");
       history.go(-1);
    </script>
<%    	
    }
%>

</body>
</html>