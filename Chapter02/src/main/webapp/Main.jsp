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

 <div class="container">
    <table border="1" width="800">
       <!-- header -->
       <tr height="150">
         <td align="center" colspan="2">
         <!-- 하나의 페이지로 읽지 않고, Header.jsp 먼저 읽어들인다. -->
            <jsp:include page="Header.jsp">
              <jsp:param value="kim" name="id"/>
            </jsp:include>
            
            <%-- <%@ include file="Header.jsp" %> --%>
         </td>
       </tr>
       
       <!-- left -->
       <tr height="400">
          <td align="center" width="200">
            <jsp:include page="Left.jsp"></jsp:include>
          </td>
       
       <!-- section -->
          <td align="center" width="600">
            <jsp:include page="Section.jsp"></jsp:include>
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