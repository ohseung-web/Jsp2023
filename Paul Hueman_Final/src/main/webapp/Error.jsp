<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
</head>
<body>
	<c:if test="${null ne LoginError}">
		<script>
			alert("${LoginError}");
			location.href= "Main.jsp?section=Login.jsp";
		</script>
	</c:if>
	
	<c:if test="${null ne pwchangeError}">
		<script>
			alert("${pwchangeError}");
			location.href= "GetUserData.do";
		</script>
	</c:if>	
	
	<c:if test="${null ne UserModifyLoginError}">
		<script>
			alert("${UserModifyLoginError}");
			location.href= "Main.jsp?section=UserModifyLogin.jsp";
		</script>
	</c:if>	
	
	<c:if test="${null ne idnull}">
		<script>
			alert("${idnull}");
			location.href= "Main.jsp?section=Join.jsp";
		</script>
	</c:if>
	
	<c:if test="${null ne null_tel_email}">
		<script>
			alert("${null_tel_email}");
			location.href= "Main.jsp?section=Lostid.jsp";
		</script>
	</c:if>
	<c:if test="${null ne PwError}">
      <script>
         alert("${PwError}");
         history.back();
      </script>
   </c:if>
   <c:if test="${null ne cartCountError}">
   		<script>
			alert("${cartCountError}");
			location.href = document.referrer;
   		</script>
   	</c:if>
   	<c:if test="${null ne BoardLogin}">
   		<script>
			alert("${BoardLogin}");
			location.href= "Main.jsp?section=Login.jsp";
   		</script>
   	</c:if>
   	<c:if test="${null ne BoardNo}">
   		<script>
			alert("${BoardNo}");
			history.back();
   		</script>
   	</c:if>
</body>
</html>