<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <h2>구구단</h2>
<%
       /* out은 JSP의 내장객체이다. */
       for(int i=2; i<=9; i++){
    	   for(int j=1; j<=9; j++){
    		   out.print(i+"*"+j+"="+(i*j)+"<br>");
     } 	
    	       out.println();
    	       out.write("<br>");
       }
               
 %>    

</body>
</html>