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

    <%
         request.setCharacterEncoding("UTF-8");
    %>
    <jsp:useBean id="mbean" class="model.MemberBean">
      <jsp:setProperty name="mbean" property="*" />
    </jsp:useBean>
    
    <%
       MemberDAO mdao = new MemberDAO();
       
       //String 타입으로 저장된 패스워드를 가저온다.(데이터 베이스에서 저장된 pass 값을 가저온다.)
       String pass = mdao.getPass(mbean.getId());
 
       //수정하기위해서 작성한 패스워드 값과 기존 데이터베이스에서 가저욘 패스워드 값이 같은지 비교
      if(pass.equals(mbean.getPw())){
    	  //MemberDAO 클래스의 회원 수정 메소드를 호출한다.
    	  mdao.updateMember(mbean);
    	  response.sendRedirect("MemberList.jsp");
    	   
       }else{ 
   %>
       <script type="text/javascript">
         alert("패스워드가 일치하지 않습니다.")
         history.go(-1);
       </script>
   <% 	   
       }       
    %>
</body>
</html>