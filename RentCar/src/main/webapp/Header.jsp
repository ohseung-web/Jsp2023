<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<style type="text/css">
  Header{
    height: 110px;
    width : 100%;
    border-bottom: 1px solid lightgray;
  }
    .headerWrap{
    width:1000px;
    margin: 0 auto;
  } 
  #navi{
    border:none;
    border-collapse: collapse;
  }
  .nav{
    font-size: 16px;
    font-weight: bold;
  }
  a{
     display:inline-block;
     width : 70px;
  }
  .nav:hover::after{
     content: '';
     display: block;
     background: #222;
     height: 5px;
     width:70px;
     position: absolute;
     bottom: 1px;
  }

</style>
</head>
<body>
<%
    String id =(String)session.getAttribute("id");
%>
<Header>
<div class="headerWrap">
   <table width="1000" id="navi">
     <tr height="70">
        <td colspan="4" align="left"><a href="RentcarMain.jsp" ><img src="img/sk_logo.png" height="65"></a></td>
        <td align="center" width="200">
        <%
           if(id == null){ %>
           <button type="button" onclick="location.href='RentcarMain.jsp?section=MemberLogin.jsp'">로그인</button>   
        <% }else{ %>
            <%=id %>님
            <button type="button" onclick="location.href='MemberLogout.jsp'">로그아웃</button>   
        <% } %>       
        </td>
     </tr>
     <tr height="50">
        <td align="center" width="200" >
           <a href="RentcarMain.jsp?section=CarReserveMain.jsp" class="nav">예약하기</a>
        </td>
        <td align="center" width="200">
           <a href="RentcarMain.jsp?section=CarReserveView.jsp" class="nav">예약확인</a>
        </td>
        <td align="center" width="200" >
           <a href="#" class="nav">게시판</a>
        </td>
        <td align="center" width="200" >
           <a href="#" class="nav">이벤트</a>
        </td>
        <td align="center" width="200" >
           <a href="#" class="nav">고객센터</a>
        </td>
     </tr>
   </table>
</div>
</Header>
</body>
</html>