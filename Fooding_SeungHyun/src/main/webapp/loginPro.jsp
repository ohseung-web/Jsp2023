<%@page import="fooding.FoodingDAO"%>
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
       //사용자로 부터 id, pw읽어들인다.
       String id = request.getParameter("id");
       String pw = request.getParameter("pw");
       
       //DB로부터 id,pw를 읽어 들인다.
       FoodingDAO fdao = new FoodingDAO();
       String dbPW = fdao.getPass(id);
       String dbId = fdao.chkId(id);
       
       //DB id, pw와 사용자로부터 입력받은 id, pw가 같은지 비교, 또한 DB에 존재하는 ID인지 체크
       if(dbPW.equals(pw) && dbId.equals(id)){
    	
    	 //세션에 저장
           session.setAttribute("id", id);
           session.setAttribute("pw", pw);
    	   
    	 // 세션의 유지시간 설정 : 60초간 유지
           session.setMaxInactiveInterval(60*2);//2분간 id유지
           response.sendRedirect("Main02.jsp");
       }else{ 
     %>
       <script>
          alert("아이디와 패스워드를 다시 확인해 주세요");
          history.go(-1);
       </script> 
   <%  }  %>  
   
   <%--  <h2> 당신의 아이디는 <%=id %>이고, 패스워드는 <%=dbPW %>입니다.  --%>
       
 <%-- <jsp:useBean id="fbean" class="fooding.FoodingBean">
          <jsp:setProperty name="fbean" property="*"/>
  </jsp:useBean> --%>

</body>
</html>