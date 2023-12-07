<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .carreserve{
       width:1000px;
       margin: 60px auto; 
    }
    .carreserve .carsearch{
      width : 800px;
      margin: 10px auto;
      text-align: center;
    }
    .carreserve .carsearch > p{
       font-size: 20px;
       color: gray;
       font-weight: bold;
    }
    table tr td > p{
      margin : 0;
      display:inline-block;
      width:300px;
      height:40px;
      text-align: center;
    }
</style>
</head>
<body>
<!-- 데이터베이스 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가저옴 -->
<%
   RentCarDAO rdao = new RentCarDAO();
   //ArrayList를 이용하여 데이터를 저장
   ArrayList<CarListBean> alist = rdao.getSelectCar();
%>
<div class="carreserve">
<table width="1000">
   <tr height="240">
   <%
      for(int i=0; i<alist.size(); i++){
          CarListBean cbean  = alist.get(i);
   %>       
     <td width="333" align="left">
     <a href="CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
      <img src="img/<%=cbean.getImg()%>" width="300" height="200"></a><br>
      <p>차량명 : <%=cbean.getName() %></p>
      </td>
   <% } %>   
   </tr>
</table>
<div class="carsearch">
    <p>챠량 검색하기</p>
    <form action="CarCategoryList.jsp" method="post">
      <label>차량 검색 하기</label>
      <select name="category">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
      </select>
      <input type="submit" value="검색">
      <button onclick="location.href='CarAllList.jsp'">전체 검색</button>
    </form>
</div>
</div>
</body>
</html>