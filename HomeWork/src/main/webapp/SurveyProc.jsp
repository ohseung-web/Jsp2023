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
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String entertainer = request.getParameter("entertainer");
  %>

  <form action="SurveyResult.jsp">
		<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="player" />
		<input type="hidden" name="name" value="<%=name%>" />  
		<!-- 이전 페이지에서 온 데이터를 새 request 의 파라미터로 다시 저장해둔다. -->
		<input type="hidden" name="entertainer" value="<%=entertainer%>" />
		<input type="submit" value="결과보기" />
	</form>

</body>
</html>