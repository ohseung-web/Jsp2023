<%@page import="bean.Person"%>
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
   //1. 표준액션태그가 없어도 사용이 가능하다.

	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	double height = Double.parseDouble(request.getParameter("height"));
	char gender = request.getParameter("gender").charAt(0);
	
	Person p = new Person();
	p.setName(name);
	p.setAge(age);
	p.setHeight(height);
	p.setGender(gender);

%>

   <ul>
		<li>성명: <%=p.getName() %></li>
		<li>나이: <%=p.getAge() %></li>
		<li>키: <%=p.getHeight() %></li>
		<li>성별: <%=p.getGender() %></li>
	</ul>
</body>
</html>