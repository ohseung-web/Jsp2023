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
    .listsearch{
       display:flex;
       justify-content: center;
       align-items: center;
    }
    .listsearch .listsearchWrap{
       margin: 60px 0;
       width: 930px;
       height: 800px;
    }
   .listsearch .listsearchWrap .car{
       display : flex;
       justify-content: flex-start;
       align-items: center;
       gap : 10px;
       flex-flow: row wrap;
    } 
    .listsearch .listsearchWrap .car .carProduct_img{
       width : 300px;
       height: 250px;
    } 
    .listsearch .listsearchWrap .carProduct_img .carProduct_caption{
       margin:0 auto;
       width:200px;
       height:50px;
       text-align:center;
       color: gray;
       font-size: 15px;
      /*  border:1px solid red; */
    }
    .listsearch .listsearchWrap .carProduct_img .carProduct_caption p{
       margin:0;
       padding:0;
    }
</style>
</head>
<body>
<div class="listsearch">
 <div class="listsearchWrap">
   <%
     //category 값 가져오기
     int category = Integer.parseInt(request.getParameter("category"));
  
     RentCarDAO rdao = new RentCarDAO();
     ArrayList<CarListBean> alist = rdao.getCategoryCar(category); 
   %>    
       <div class="car">
   <%       
       for(int i=0; i<alist.size(); i++){
	  
	   //ArrayList에 저장되어 있는 반클래스를 호출
	   CarListBean cbean = alist.get(i);
    %>
      <div class="carProduct_img">
        <a href="RentcarMain.jsp?section=CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
          <img alt="" src="img/<%=cbean.getImg()%>" width="280" height="180">
        </a> 
        <div class="carProduct_caption">
         <p>차량명 : <%=cbean.getName() %></p><br>
         <p>금 액 : <%=cbean.getPrice() %></p>   
        </div>
      </div>
   <% } %> 
      </div>   
  </div>
</div>   



<%-- <table width="1000">
<%
      //category 값 가져오기
      int category = Integer.parseInt(request.getParameter("category"));
       
      RentCarDAO rdao = new RentCarDAO();
      ArrayList<CarListBean> alist = rdao.getCategoryCar(category);
      //tr을 3개씩 보여주고 다시 tr을 실행 할 수 있도록 하는 변수
      int j=0;
      for(int i=0; i<alist.size(); i++){
    	  
    	  //ArrayList에 저장되어 있는 반클래스를 호출
    	  CarListBean cbean = alist.get(i);
    	  if(j % 3 ==0){ //한줄에 3개의 차량씩 보여주는 코드
%>
      <tr height="220">
<% } %>
       <td width="333" align="center">
       <a href="RentCarMain.jsp?section=CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
          <img alt="" src="img/<%=cbean.getImg()%>" width="280" height="180">
       </a><br>
       <p>차량명 : <%=cbean.getName() %></p>
       </td>
<% 
          j++; //j값을 증가하여         
      }  
%>
</table> --%>

</body>
</html>