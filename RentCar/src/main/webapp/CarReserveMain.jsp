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
       height: 600px;
       margin: 60px auto; 
    }
    .carreserve .carsearch{
      width : 800px;
      margin: 10px auto;
      text-align: center;
      display:flex;
      justify-content: center;
      align-items: center;
      /* border:1px solid red; */
    }
    .carreserve .search_title{
      margin : 50px auto;
      width : 1000px;
      display : inline-block;
      font-size: 20px;
      color: gray;
      font-weight: bold;
      text-align: center;
    }
    table tr td > p{
      margin : 0;
      display:inline-block;
      width:300px;
      height:40px;
      text-align: center;
    }
    .carsearch label{
      font-size: 18px;
      margin-right: 20px;
    }
    .carsearch  select{
       width : 60px;
       height: 25px;
    }
    .carsearch input[type=submit],.carsearch button {
       width: 80px;
       height: 26px;
       cursor: pointer;
       padding:0;
       margin:0;
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
     <a href="RentcarMain.jsp?section=CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
      <img src="img/<%=cbean.getImg()%>" width="300" height="200"></a><br>
      <p>차량명 : <%=cbean.getName() %></p>
      </td>
   <% } %>   
   </tr>
</table>
<p class="search_title">챠량 검색하기</p>
<div class="carsearch">
    <form action="RentcarMain.jsp?section=CarCategoryList.jsp" method="post">
      <label>차량 검색 하기</label>
      <select name="category">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
      </select>&nbsp;&nbsp;
      <input type="submit" value="검색">&nbsp;&nbsp;
    </form>
    <button onclick="location.href='RentcarMain.jsp?section=CarAllList.jsp'">전체 검색</button>
</div>
</div>
</body>
</html>