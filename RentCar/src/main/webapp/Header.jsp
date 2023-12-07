<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{box-sizing: border-box;text-decoration: none; color:black;}
  Header{
    position:absolute;
    left:0;
    top:0;
    width : 100%;
    border-bottom: 1px solid lightgray;
  }
  .container01{
    width:1000px;
    margin: 0 auto;
  }
  table{
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
    if(id == null){
    	id="GEST";
    }

%>
<Header>
<div class="container01">
   <table width="1000" >
     <tr height="70">
        <td colspan="4"><a href="RentcarMain.jsp" ><img src="img/sk_logo.png" height="65"></a></td>
        <td align="center" width="200">
           <%=id %>님 환영합니다.
        </td>
     </tr>
     <tr height="50">
        <td align="center" width="200" >
           <a href="RentcarMain.jsp?section=CarReserveMain.jsp" class="nav">예약하기</a>
        </td>
        <td align="center" width="200">
           <a href="#" class="nav">예약확인</a>
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