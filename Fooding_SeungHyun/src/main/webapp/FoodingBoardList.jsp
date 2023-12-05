<%@page import="java.util.ArrayList"%>
<%@page import="fooding.FoodingBoardBean"%>
<%@page import="fooding.FoodingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{
    box-sizing: border-box;
    text-decoration: none;
    color:black;
  }
  a{
     font-weight: bold;
  }
  a:hover{
    text-decoration: underline;
  }
  .container{
     margin: 50px auto;
     width:1000px;
     height: 640px;
  }
  h2{
     text-align: center;
  }
  .container .btn{
    margin: 30px auto;
    text-align: center;
  }
  .btn button{
     width:150px;
     height: 40px;
     font-size: 20px;
     cursor: pointer;
     text-align:center;
     font-weight: bold; background-color: #00a7b3; color:white; border-radius: 5px;
     border : none;
  }
  table{
    border-collapse: collapse;
  }
  table tr{
     height: 45px; 
     border-bottom: 1px solid lightgray;
  }
  table th{
   margin:0;
   padding:0;
   width: 150px; 
   height: 45px; 
   background-color: #fbfbfb; 
   border-top: 1px solid black; 
   font-size: 1em; 
   border-bottom: 1px solid lightgray;
  }
  table th:nth-child(2) {
	width : 600px;
  }
  table th:nth-child(3) {
	width : 100px;
  }
  p{
    margin: 0 auto;
    text-align: center;
    display:block;
    width: 70px;
    height: 25x;
    line-height: 25px;
    font-size: 13px;
  }
  #receipt{
    background-color: lightgray;
  }
  #complete{
    background-color: #00a7b3;
    color:white;
  }
</style>
</head>
<body>
 <%
    FoodingDAO fdao = new FoodingDAO();
    ArrayList<FoodingBoardBean> alist = fdao.allFooding();
    
    String id = (String)session.getAttribute("id");
    int chk = 0;
   
 %>
 <div class="container">
    <h2> 1:1 문의하기 </h2>
    <div class="btn">
      <button type="button" onclick="location.href='Main02.jsp?section=BoardWrite.jsp'">1:1문의하기</button>
    </div>
    <table>
        <tr>
           <th>등록일</th>
           <th>문의내용</th>
           <th>작성자</th>
           <th>문의상태</th>
        </tr>
        
          <%
              for(int i=0; i<alist.size(); i++){
            	  FoodingBoardBean fbean =  alist.get(i);
            	  
            	  if(id == null && fbean.getRe_step() != 2){ // 로그인이 안된 상태는 [답변]보이지 않게 지정
           %>
                   <tr>
                 	    <td align="center"><%=fbean.getReg_date() %></td>
                 	    <td>
                 	       <a href="Main02.jsp?section=FoodingInfo.jsp?id=<%=id%>&num=<%=fbean.getNum()%>">
                 	        <% // [답변]앞에 3칸 들여쓰기
                 	          if(fbean.getRe_step() == 2){
                 	        	 for(int j=0; j<3; j++){
                 	        %>
                 	            &nbsp; 
                 	        <%		 
                 	        	 }	 
                 	          }
                 	        %>   
                 	       <%=fbean.getSubject()%></a>
                 	    </td>
                 	    <td align="center"><%=fbean.getName().substring(0, 2)+"*"%></td>
                 	    <td>
                 	     <% 
                 	        if(fbean.getRe_step() == 5){
                 	     %>   
                 	         <p id="complete">답변완료</p>
                 	     <%       
                 	        }else{
                 	     %>
                 	         <p id="receipt">문의접수</p> 
                 	     <%   
                 	        }
                 	     %>
                 	    </td>
                 	 </tr>    
           <%  
            	  }else if(id !=null){ //로그인된 후 모두 보이게 지정
           %>
                     <tr>
                 	    <td align="center"><%=fbean.getReg_date() %></td>
                 	    <td>
                 	       <a href="Main02.jsp?section=FoodingInfo.jsp?id=<%=id%>&num=<%=fbean.getNum()%>">
                 	        <% // [답변]앞에 3칸 들여쓰기
                 	          if(fbean.getRe_step() == 2){
                 	        	 for(int j=0; j<3; j++){
                 	        %>
                 	            &nbsp; 
                 	        <%		 
                 	        	 }	 
                 	          }
                 	        %>   
                 	       <%=fbean.getSubject()%></a>
                 	    </td>
                 	    <td align="center"><%=fbean.getName().substring(0, 2)+"*"%></td>
                 	    <td>
                 	     <% 
                 	        if(fbean.getRe_step() == 5){
                 	     %>   
                 	         <p id="complete">답변완료</p>
                 	     <%       
                 	        }else if(fbean.getRe_step() == 2){
                 	     %>
                 	         <p></p>
                 	     <%   
                 	        }else{
                 	     %>
                 	        <p id="receipt">문의접수</p>  
                 	     <%   
                 	        }	
                 	     %>
            
                 	    </td>
                 	 </tr>    
           <% 		  
            	  }
              }	  
          %>
  </table>
 </div>
</body>
</html>