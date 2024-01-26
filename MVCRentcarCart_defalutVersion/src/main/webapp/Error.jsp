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
   <c:if test="${null ne LoginError}">
		<script>
			window.alert("${LoginError}");
			location.href= "RentcarMain.jsp?section=MemberLogin.jsp";
		</script>
	</c:if>
	<c:if test="${null ne msgchk}">
		<script>
			window.alert("${msgchk}");
			location.href= "JangProc.do";
		</script>
	</c:if>
	<c:if test="${null ne msgDelete}">
		<script>
			window.alert("${msgDelete}");
			location.href= "JangProc.do";
		</script>
	</c:if>
</body>
</html>
