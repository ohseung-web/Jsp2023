<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
   *{box-sizing: border-box; list-style: none; text-decoration: none; color:black;}
   
 /*   body{
      display: flex;
      justify-content: center;
   } */
   Header{
      margin: 0 auto;
      width : 1400px;
      height: 110px;
      border-bottom: 1px solid #cecece;
     /*  line-height: 1 !important; */
   }
   .nav_wrap{
      display: flex;
      justify-content: space-between;
      align-items: center;
      gab:20px;
   }
   .nav_wrap #nav01, .nav_wrap #nav02{
     width:700px;
     height: 40px; 
     display:flex;
     justify-content:right;
     align-items:center;
   }
   .nav_wrap ul li{
     width:120px;
     text-align:center;
   }
   .nav_wrap ul li a{
     font-size: 16px;
     font-weight: 700;
   }
   .nav_wrap #nav01 ul{
      width:700px;
      height: 40px;
      display: flex;
      justify-content:space-around;
      align-items: center;
   }
   .nav_wrap #nav02 ul {
      width: 450px;
      height: 40px;
      display: flex;
      justify-content:space-around;
      align-items: center;
      padding-left:0;
   }
   .nav_wrap #nav02 ul li:nth-child(1) {
	width:150px;
}
  
</style>
</head>
<body>

<%
     request.setCharacterEncoding("UTF-8");
     String logout = request.getParameter("logout");
     
     if(logout != null){
    	 session.setAttribute("id", null);
    	 session.setMaxInactiveInterval(0);
     }

     String id = (String)session.getAttribute("id");
%>

     <Header>
        <div class="wrap">
           <a href="Main02.jsp?section=Section02.jsp"><img alt="title" src="img/logo.JPG"></a>
        <div class="nav_wrap">  
           <nav id="nav01">
			<ul>
			<%
			   if( id != null && id.equals("admin123")){
			%>
			    <li><a href="#">회원관리</a></li>
				<li><a href="Main02.jsp?section=FoodingBoardList.jsp">게시판관리</a></li>
				<li><a href="#">상품관리</a></li>
			<% 	   
			   }else{
			%>
			    <li><a href="#">카테고리 전체</a></li>
				<li><a href="#">신상품</a></li>
				<li><a href="#">베스트</a></li>
				<li><a href="#">세일</a></li>
				<li><a href="#">입점브랜드</a></li>
				<li><a href="#">푸딩콕</a></li>
			<%	   
			   }
			%> 
			</ul>
		   </nav>
		   <nav id="nav02">
			<ul>
<%
			if(id == null){
%>
				<li><a href="Main02.jsp?section=login.jsp">로그인</a></li>
				<li><a href="Main02.jsp?section=FoodingJoinForm.jsp">회원가입</a></li>
				<li><a href="Main02.jsp?section=FoodingMainList.jsp">1:1문의</a></li>
<% 
			}else if(id.equals("admin123")){
%>	    
				<li><a href="#">관리자님 로그인!</a></li>
				<li><a href="Main02.jsp?logout=1">로그아웃</a></li>
<% 
			}else{
%>	
				<li><a href="#"><%=id %>님 로그인!</a></li>
				<li><a href="Main02.jsp?logout=1">로그아웃</a></li>
				<li><a href="Main02.jsp?section=FoodingBoardList.jsp">1:1문의</a></li>
<% 
			}
%>
			</ul>
		  </nav>
		</div>   
        </div>
     </Header>
</body>
</html>