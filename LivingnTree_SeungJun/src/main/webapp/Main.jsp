<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String section = request.getParameter("section");
	if(section == null){
		section = "Section.jsp";
	}
%>
<%-- <c:if test="${empty section}"> <!-- section이 null이면 -->
    <c:set var="section" value="Section.jsp" />
</c:if> --%>
<div class="container">
	<jsp:include page="Header.jsp"/>
		<section>
			<jsp:include page="<%=section %>"/>
		</section>
	<jsp:include page="Footer.jsp"/>
</div>

</body>
</html>