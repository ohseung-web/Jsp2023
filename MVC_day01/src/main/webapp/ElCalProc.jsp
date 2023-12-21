<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    body{
      display:flex;
      justify-content:center; 
    }
    h2{
      text-align: center;
    }
</style>
</head>
<body>
  <!-- El은 파싱을 할 수 없다. -->
  <div class="resultContainer">
     <h2>결과 보기</h2>
     <%
        String exp2 = request.getParameter("exp2");
        
        if(exp2.equals("+")){
     %>
         결과는 ${param.exp1 + param.exp3 } 
     <%   	
        }else if(exp2.equals("-")){
      %>
         결과는 ${param.exp1 - param.exp3 } 
      <%   	
        }else if(exp2.equals("*")){
       %>
         결과는 ${param.exp1 * param.exp3 } 
      <% } else{ %>
          결과는 ${param.exp1 / param.exp3 } 
     <% } %>
  </div>
  
  
</body>
</html>