<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2>삼각형 별 모양 출력</h2>
  <hr>
  <%
      int k = 4; /* 공백의ㅣ 개수  */
      for(int i=0; i<5; i++){
    	  for(int j=k; j>0; j--){ /* 공백 출력 */
    		  out.print("&nbsp");
    	  }
    	  for(int j=0; j<i+1; j++){
    		  out.print("*");  /* *출력 */
    	  }
    	  out.print("<br>");
    	  k--;/* 공백이 개수를 1씩 감소 */
      }
      
  
  %>
</body>
</html>