<%@page import="model.BoardDAO"%>
<%@page import="model.BoardBean"%>
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
  %>
  <!-- 게시글 작성한 데이터를 한번에 읽어들인다.  -->
  <jsp:useBean id="boardBean" class="model.BoardBean">
     <jsp:setProperty name="boardBean" property="*" />
  </jsp:useBean>
  <%
      //데이터 베이스 쪽으로 빈클래스 넘겨준다
      BoardDAO bdao = new BoardDAO();
      
     if(boardBean.getSubject() != null){
    	//데이터 저장 메소드 호출
         bdao.insertBoard(boardBean);
     }
     
      //게시글 저장후 전체게시글 보기
      response.sendRedirect("BoardList.jsp");
  %>
  
</body>
</html>