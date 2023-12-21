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
    int i = 3;

    //출력하는 방법
    out.println("i="+i);
    
    request.setAttribute("ia", "3");
  %>
    <p>i = <%=i %></p>

     <!-- EL표현식 : 그냥 변수이름으로는 출력 불가능-->
      i = ${i } <br>
     <!-- EL표현식은 request객체나 session객체에 담아 놓고 담아놓은 값을 출력해야 한다.  -->
      i = ${ia + 4} <!-- Strimg이 숫자로 변경되어 계산된다. --> 
      
      
</body>
</html>