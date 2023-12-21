<%@page import="model.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
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
       justify-content: center;
    }
    table{
      border-collapse: collapse;
    }
    h2{
      text-align: center;
    }
    a{
      text-decoration: none
    }
    p{
       text-align: center;
    }
</style>
</head>
<body>

 <div class='container'>
   <h2> 전체 게시글 보기 </h2>
   <!-- 게시글 보기에 카운터링(페이징)을 설정을하기위한 변수 선언 -->
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
      BoardDAO bdao = new BoardDAO();
      //전체 게시글의 갯수를 읽어들인 메소드 호출
      count = bdao.getAllCount();
      
      //현재 페이지에 보여줄 시작번호를 설정 - 데이버 베이스에서 불러올 시작번호
      int startRow = (currentPage - 1)*pageSize + 1;
      int endRow = currentPage * pageSize; //mysql은 사용불가
      
      // 최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
      ArrayList<BoardBean> alist = bdao.getAllBoard(startRow,pageSize);
      
      //테이블에 표시할 번호를 지정(최신글 순으로 번호 매겨짐)
       number = count - (currentPage -1) * pageSize; 
   %>
   <table width="700" border="1">
    <tr height="40">
         <td align="right" colspan="5">
           <input type="button" value="글쓰기" onclick="location.href='BoardWriterForm.jsp'">
         </td>
     </tr>
     <tr height="40">
        <td width="50" align="center">번호</td>
        <td width="320" align="center">제목</td>
        <td width="100" align="center">작성자</td>
        <td width="150" align="center">작성일자</td>
        <td width="80" align="center">조회수</td>
     </tr>
     <%
         for(int i=0; i<alist.size(); i++){
        	 BoardBean bean = alist.get(i);
        	 
        	 if(bean.getSubject() != null){
        		   %>
        	        <tr height="40">
        	           <td width="50" align="left"><%=number-- %></td>
        	           <td width="320" align="left"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>">
        	           <%
        	              if(bean.getRe_step() > 1){
        	            	  for(int j=0; j<(bean.getRe_step()-1)*2; j++){
        	            %>&nbsp;
        	            <%		  
        	            	  }
        	              }
        	           %>
        	              <%=bean.getSubject() %></a></td>
        	           <td width="100" align="left"><%=bean.getWriter() %></td>
        	           <td width="150" align="left"><%=bean.getReg_date() %></td>
        	           <td width="80" align="left"><%=bean.getReadcount() %></td>
        	       </tr> 
        	
        	<% } %> 
     <%  } %>
   </table>
   <p>
   <!-- 페이지 카운터링 소스를 작성  -->
    <%
      if(count  > 0){
    	  //카운터링 숫자를 얼마까지 보여줄건지 결정
    	  int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 
    	  //시작페이지 숫자를 설정
    	  int startPage = 1;
    	  if(currentPage % 4 != 0){
    		  startPage = (int)(currentPage/4)*4+1;
    	  }else{
    		  startPage = ((int)(currentPage/4)-1)*4+1; 
    	  }
    	  int pageBlock = 4 ; //카운터링 처리숫자를 의미함.
    	  int endPage = startPage + pageBlock -1; // 화면에 보여질 페이지의 마자막숫자
    	  if(endPage > pageCount ){
    		  endPage = pageCount;
    	  }
    	  //이전이라는 링크를 만들건지 파악
    	  if(startPage > 4){
     %>
         <a href = "BoardList.jsp?pageNum=<%=startPage-4%>"> [이전] </a>   		  
     <%   	  
    	  }
    	  //페이징 처리
    	  for(int i=startPage;i<=endPage;i++){
    		  %>
    	         <a href = "BoardList.jsp?pageNum=<%=i%>"> [<%=i %>] </a>   		  
    	 <%
    	  }
    	  //다음이라는 링크를 만들건지 파악
    	  if(endPage < pageCount){
       %>
 	         <a href = "BoardList.jsp?pageNum=<%=startPage+4%>"> [다음] </a>   		  
 	   <%
    	  }
       }
    %>
   </p>
 </div>      
</body>
</html>