<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
</head>
<body>
<%
	String section = request.getParameter("section");
	if(section == null){
		section = "Section.jsp";
	}
%>
<div class="container">
	<jsp:include page="Header.jsp"/>
		<section>
			<jsp:include page="<%=section%>"/>
		</section>
	<jsp:include page="Footer.jsp"/>
</div>
</body>
</html>