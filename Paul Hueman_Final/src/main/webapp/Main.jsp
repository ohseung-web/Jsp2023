<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="img/AMONG.PNG" rel="shorcut icon" type="img/x-icon">
<title>Paul Hueman</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String section = request.getParameter("section");
	
	if(section == null){
		section = "Section.jsp";
	}
%>

<jsp:include page="Header.jsp"/>
<jsp:include page="<%=section %>"/>
<jsp:include page="Footer.jsp"/>
</body>
</html>