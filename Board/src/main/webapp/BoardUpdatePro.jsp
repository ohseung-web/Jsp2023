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
        request.setCharacterEncoding("UTF-8");

%>
 <!--  게시글 작성한 데이터를 한번에 읽어들이는 빈클래스 설정-->
<jsp:useBean id="boardbean"  class="Model.BoardBean">
      <jsp:setProperty name="boardbean"  property="*" /> <!-- 데이터들을 매핑함  -->
</jsp:useBean>

<%
         //데이터베이스 연결
        BoardDAO bdao= new BoardDAO();

        // 해당 게시글의 패스워드 값을 읽어옴 , updateform에서의 패스워드임
         String pass = bdao.getPass(boardbean.getNum());
        
      // 기존패스워드값과 업데이트시 작성했던 값이 같은지 비교 한다.
         
        /*  System.out.println("DB의 패스워드"+pass);
         System.out.println("패스워드"+boardbean.getPassword()); */
         
      if(pass.equals(boardbean.getPassword())){
    	    //데이터 수정하는 메소드 호출 */
    	    bdao.updateBoard(boardbean);
    	    //수정이 완료되면 전체게시글 보기
    	    response.sendRedirect("BoardList.jsp");  
    	    
      }else { //패스워드가 틀리면
  %>
         <script>
             alert("패스워드가 일치하지 않습니다. 확인 후 수정해 주세요");
             history.go(-1);
         </script>  
<%         	  
      }
%>


</body>
</html>