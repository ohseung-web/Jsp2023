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
       request.setCharacterEncoding("UTF-8");
   %>
   <jsp:useBean id="boardbean" class="model.BoardBean">
     <jsp:setProperty name="boardbean" property="*" />
   </jsp:useBean>
   <%
      BoardDAO bdao = new BoardDAO();
      // 해당 게시글의 패스워드 값을 얻어온다.
      String dbPw = bdao.getPass(boardbean.getNum());
      
      //기존 패스워드값과 업데이트시 작성한 패스워드 값이 같은지 비교
      if(dbPw.equals(boardbean.getPassword())){
    	  //데이터 수정하는 메소드 호출
    	  bdao.updateBoard(boardbean);
    	  //수정이 완료되면 전체 게시글 보기로 이동
    	  response.sendRedirect("BoardList.jsp");
      }else{
  %>
      <script type="text/javascript">
        alert("패스워드를 확인하세요!");
        history.go(-1);
      </script> 
  <% }%>
</body>
</html>