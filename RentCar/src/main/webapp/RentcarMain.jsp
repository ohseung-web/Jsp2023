<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  section{
   position:absolute;
   left:0;
   top:120px;
   width:100%;
 /*    height: 100vh; */
  }
</style>
</head>
<body>
<%
    String section = request.getParameter("section");
    if(section == null){
    	section = "Section.jsp";
    }
%>
<jsp:include page="Header.jsp" />
 <section>
   <jsp:include page="<%=section %>" />
 </section>  
<jsp:include page="Footer.jsp"/>   

</body>
</html>

