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

<div class="calcontainer">
   <h2>계산기</h2>
   <!-- 자기자신 form으로 보내는 것을 재귀라고 한다. -->
   <form action="ElCal.jsp" method="post">
      <table width="450">
        <tr height="40">
           <td width="100" align="center">
             <input type="text" name="exp1" value="${param.exp1}">
           </td>
           <td width="100" align="center">
             <select name="exp2">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
             </select>
           </td>
           <td width="100" align="center">
             <input type="text" name="exp3" value="${param.exp3}">
           </td>
           <td width="20" align="center">=</td>
           <td width="100" align="center">
            <%
             String exp2 = request.getParameter("exp2");
            
             //반드시 null 처리한다.
             if(exp2 == null){
            	 exp2 ="+";
             }
             
             if(exp2.equals("+")){
            %>
              <input type="text" name="exp4" value="${param.exp1 + param.exp3 } ">
           <%   	
             }else if(exp2.equals("-")){
           %>
             <input type="text" name="exp4" value="${param.exp1 - param.exp3 } ">
           <%   	
              }else if(exp2.equals("*")){
           %>
             <input type="text" name="exp4" value="${param.exp1 * param.exp3 } ">
           <% } else{ %>
             <input type="text" name="exp4" value="${param.exp1 / param.exp3 } ">
           <% } %>
           
           </td>
           <td width="100" align="center">
             <input type="submit" value="결과보기">
           </td>
        </tr>
      </table>
   </form>   
</div>

</body>
</html>