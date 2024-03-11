<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LivingnTree</title>
</head>
<body>
	<script type="text/javascript">
		alert("${msgError}");
		location.href = "index.jsp?section=MemberLogin.jsp";
	</script>
</body>
</html>