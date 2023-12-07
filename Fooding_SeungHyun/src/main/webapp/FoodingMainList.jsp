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
  .pageing{
    width:1000px;
    height: 25px;
    text-align:center;
    margin : 30px auto;
  }
</style>
</head>
<body>
 <%
    FoodingDAO fdao = new FoodingDAO();
    String id = (String)session.getAttribute("id");
 %>
 <div class="container">
    <h2> 1:1 문의하기 </h2>
    <%
     //한 화면에 보여질 게시글의 개수를 지정
     int pageSize = 5;
   
     //현재 카운터를 클릭한 번호값을 읽어옴
     String pageNum = request.getParameter("pageNum");
     //만약 처음 boardList.jsp를 클릭하거나 수정, 삭제등 다른 게시글에서 이 페이지로 넘어오면
     // pageNum값이 없기때문에 null처리를 해준다.
     if(pageNum == null){
    	 pageNum = "1";
     }
     
     int count = 0; //전체 글의 갯수를 저장하는 변수
     int number = 0; // 10, 9, 8, 7, 6..... 페이지 넘버링 변수
     // 현재보고자 하는 페이지 숫자를 저장
     int currentPage = Integer.parseInt(pageNum);
      //전체게시글의 내용을 BoardList.jsp로 가져온다.
      
      //전체 게시글의 갯수를 읽어들인 메소드 호출
      count = fdao.getAllMainCount();
      
      //현재 페이지에 보여줄 시작번호를 설정 - 데이버 베이스에서 불러올 시작번호
      int startRow = (currentPage - 1)*pageSize + 1;
      int endRow = currentPage * pageSize; //mysql은 사용불가
      
      // 최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
      ArrayList<FoodingBoardBean> alist = fdao.allMainFooding(startRow, pageSize);
      
      //테이블에 표시할 번호를 지정(최신글 순으로 번호 매겨짐)
       number = count - (currentPage -1) * pageSize; 
   %>
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
            	  
           %>
                     <tr>
                 	    <td align="center"><%=fbean.getReg_date() %></td>
                 	    <td>
                 	       <a href="Main02.jsp?section=FoodingInfo.jsp?id=<%=id%>&num=<%=fbean.getNum()%>">
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
            	  } 
          %>
  </table>
  <div class="pageing">
      <%
      if(count  > 0){
    	  //카운터링 숫자를 얼마까지 보여줄건지 결정
    	  int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 
    	  //시작페이지 숫자를 설정
    	  int startPage = 1;
    	  if(currentPage % 2 != 0){
    		  startPage = (int)(currentPage/2)*2+1;
    	  }else{
    		  startPage = ((int)(currentPage/2)-1)*2+1; 
    	  }
    	  int pageBlock = 2 ; //카운터링 처리숫자를 의미함.
    	  int endPage = startPage + pageBlock - 1; // 화면에 보여질 페이지의 마자막숫자
    	  if(endPage > pageCount ){
    		  endPage = pageCount;
    	  }
    	  //이전이라는 링크를 만들건지 파악
    	  if(startPage > 2){
     %>
         <a href = "Main02.jsp?section=FoodingMainList.jsp?pageNum=<%=startPage-2%>"> [이전] </a>   		  
     <%   	  
    	  }
    	  //페이징 처리
    	  for(int i=startPage;i<=endPage;i++){
    		  %>
    	         <a href = "Main02.jsp?section=FoodingMainList.jsp?pageNum=<%=i%>"> [<%=i %>]&nbsp;&nbsp; </a>   		  
    	 <%
    	  }
    	  //다음이라는 링크를 만들건지 파악
    	  if(endPage < pageCount){
       %>
 	         <a href = "Main02.jsp?section=FoodingMainList.jsp?pageNum=<%=startPage+2%>"> [다음] </a>   		  
 	   <%
    	  }
       }
    %>
  </div>
 </div>
</body>
</html>