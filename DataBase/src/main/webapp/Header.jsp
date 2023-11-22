<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  body{
     display:flex;
     justify-content: center;
     height: 100vh;
  }
  table tr:nth-child(2) td {
	width: 100px;
	font-size: 15px;
 }
 table tr:nth-child(2) td:nth-child(7) {
	width:200px;
}
 
</style>
</head>
<body>
<%
  
   //logout클릭시 파라미터를 통해서 로그아웃인지 파악할때 사용할 값
    String logout =  request.getParameter("logout");
    
   if(logout != null){
	   
	    //로그아웃은 session의 유지시간을 끊어주면 된다.
       session.setAttribute("id", null);
       //session 유지시간을 즉시 끊어주세요
       session.setMaxInactiveInterval(0);
    }

   //세션을 통해 id를 읽어 들임
   String id = (String)session.getAttribute("id");
   //로그인이 되어 있지 않다면 session값이 null이되므로 null 처리
   if(id == null){
	   id ="손님";
   }
%>
   <div class="container">
      <table width="800">
         <tr height="100" >
         <!-- 이미지 로고 -->
            <td colspan="2" align="center">
             <img alt="" src="img/logo.jpg" width="200" height="70">
            </td>
            <td colspan="5" align="center">
              <font size="10">Romantic Camping</font>
            </td> 
          </tr>
          <tr height="50">
            <td align="center">텐트</td>
            <td align="center">의지</td>
            <td align="center">식기류</td>
            <td align="center">침낭</td>
            <td align="center">테이블</td>
            <td align="center">화롯대</td>
            <td width="200" align="center">	 
            <%
              if(id.equals("손님")){
             %>
               <%=id%> 님  <button onclick="location.href='SessionMain.jsp?pageChange=SessionLoginForm.jsp'">로그인</button>
            <%  }else{ %>
               <%=id%> 님  <button onclick="location.href='SessionMain.jsp?logout=1'">로그아웃</button>
            <% } %>
            </td>
          </tr>
      </table>
   </div>
</body>
</html>

