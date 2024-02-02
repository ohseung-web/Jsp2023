<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="SHORTCUT ICON" href="img/logoicon.png">
<title>ลืฦด</title>
<style>
	body{overflow-y: scroll;}
</style>
</head>
<body>
	<c:if test="${empty section}"> <!-- section == null -->
 		<c:set var = "section" value="Section.jsp"/>
	</c:if>
	
	<jsp:include page="Header.jsp"></jsp:include>
	<jsp:include page="${section}"></jsp:include>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>