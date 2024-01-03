<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${msg != null}">
  <script type="text/javascript">
     alert("${msg}");
     location.href='BoardReWriterCon.do';
  </script>  
</c:if>
</body>
</html>