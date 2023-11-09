<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <%
	int a = (int)(Math.random() * 10) + 1;
	int b = (int)(Math.random() * 10) + 1;
	int i = (int)(Math.random() * 5);  // 랜덤하게 생성되는 i 값
	String[] opList = {"+", "-", "*", "/", "%"};
  %>

   <h3>랜덤 계산기</h3>
	<form action="calculatorProc.jsp">
		<%=a%> <%=opList[i]%> <%=b%> = <input type="text" name="result" size="3" />
		<input type="submit" value="제출" />
		<input type="hidden" name="a" value="<%=a%>" />
		<input type="hidden" name="b" value="<%=b%>" />
		<input type="hidden" name="op" value="<%=opList[i]%>" />
	</form>

</body>
</html>