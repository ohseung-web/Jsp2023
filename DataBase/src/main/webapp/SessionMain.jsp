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
  table{
     border-collapse: collapse;
  }
</style>
</head>
<body>
 
 <%
     // section 값을 변경해주기위해 request값을 받아온다.
     String select = request.getParameter("pageChange");
 
      // 처음 SessionMain.jsp를 실행하면 null값이 실행되기에 null처리한다.
      if(select == null){
    	  select = "Section.jsp";
      }
 
 %>

 <div class="container3">
    <table border="1" width="800">
       <!-- header -->
       <tr height="150">
         <td align="center" colspan="2">
         <!-- 하나의 페이지로 읽지 않고, Header.jsp 먼저 읽어들인다. -->
            <jsp:include page="Header.jsp"></jsp:include>
         </td>
       </tr>
       <!-- left -->
       <tr height="400">
          <td align="center" width="100">
            <jsp:include page="Left.jsp"></jsp:include>
          </td>
       <!-- section -->
          <td align="center" width="700" >
            <jsp:include page="<%=select %>" ></jsp:include>
          </td>
       </tr>
       <!-- footer -->
       <tr height="150">
          <td align="center" colspan="2">
            <jsp:include page="Footer.jsp"></jsp:include>
          </td>
       </tr>
    </table>
 </div>

</body>
</html>