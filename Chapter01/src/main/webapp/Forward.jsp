<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- form태그의 method를 지정하지 않으면  default는 get임을 주의하자. --> 
   <form action="ForwardProc.jsp">
		당신의 나이는?
		<input type="text" name="age" />
		<input type="submit" value="확인" />
	</form>

</body>
</html>

