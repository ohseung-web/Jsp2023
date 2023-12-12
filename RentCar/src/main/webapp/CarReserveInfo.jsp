<%@page import="db.CarListBean"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .info{
       width:1000px;
       height: 600px;
       margin: 60px auto; 
    }
    #carname{
      font-size:20px;
      color:gray;
      font-weight: bold;
      text-align: center;
    }
</style>
</head>
<body>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    RentCarDAO rdao = new RentCarDAO();
    
    //랜트카 하나의 정보를 얻어온다.
    CarListBean cbean = rdao.getOneCar(no);
    int category = cbean.getCategory();
    String Catename="";
    if(category == 1)Catename="소형";
    else if(category == 2)Catename="중형";
    else Catename="대형";
%>
<div class="info">
<form action="RentcarMain.jsp?section=CarOptionSelect.jsp" method="post">
   <table width="1000">
     <tr height="100">
        <td align="center" colspan="3" id="carname"><%=cbean.getName() %> 차량 선택</td>
     </tr>
     <tr>
         <td rowspan="6" width="500">
            <img alt="" src="img/<%=cbean.getImg()%>" width="450">
         </td>
         <td width="250" align="center">차량이름</td>
         <td width="250" align="center"><%=cbean.getName() %></td>
     </tr>
     <tr>
       <td width="250" align="center">차량수량</td>
       <td width="250" align="center">
          <select name="Carcnt">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
          </select>
       </td>
     </tr>
     <tr>
       <td width="250" align="center">차량분류</td>
         <td width="250" align="center"><%=Catename %></td>
     </tr>
     <tr>
       <td width="250" align="center">대여가격</td>
         <td width="250" align="center"><%=cbean.getPrice()%>원</td>
     </tr> 
     <tr>
       <td width="250" align="center">제조회사</td>
         <td width="250" align="center"><%=cbean.getCompany() %></td>
     </tr>   
     <tr>
        <td align="center" colspan="2">
            <input type="hidden" name="no" value="<%=cbean.getNo() %>">
            <input type="hidden" name="img" value="<%=cbean.getImg() %>">
           <input type="submit" value="옵션선택후 구매하기">
        </td>
     </tr>
   </table>
</form>   
</div>
</body>
</html>