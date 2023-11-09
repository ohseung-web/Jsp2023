<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="calculatorResult.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
	int result = Integer.parseInt(request.getParameter("result"));
	String op = request.getParameter("op");
	
	int answer = 0;
	switch (op) {
	case "+" : answer = a + b;  break;
	case "-" : answer = a - b;  break;
	case "*" : answer = a * b;  break;
	case "/" : answer = a / b;  break;
	case "%" : answer = a % b;  break;
	}
	
	String message = "";
	if ( result == answer ) {
		message += a + op + b + "=" + result + "<br/>정답입니다.";
	} else {
		message += "제출 : " + a + op + b + "=" + result + "<br/>";
		message += "정답 : " + a + op + b + "=" + answer;
	}	
	
%>

    <%=message%>
	<br/><br/>
	<a href="calculator.jsp">다시풀기</a>
</body>
</html>