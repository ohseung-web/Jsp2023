<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
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
   .reserve{
       width:1000px;
       height: 500px;
       margin: 100px auto; 
   }
   h2{
      text-align: center;
   }
   button{
     cursor: pointer;
   }
 </style>
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    
    if(id == null){
%>
    <script type="text/javascript">
       alert("로그인 후 사용하세요!")
       location.href='RentcarMain.jsp?section=MemberLogin.jsp';
    </script>
<%    	
    }
    	
      //로그인된 id를 읽어 들인다.
      //한사람이 여러대를 에약 할 수 있으므로 ArrayList를 이용함
      RentCarDAO rdao = new RentCarDAO();
      ArrayList<CarViewBean> carlist = rdao.getAllReserve(id);
%>
      <div class="reserve">
      <h2>차량 예약 내역</h2>
      <table width="1000"  border="1">
         <tr height="40">
            <td align="center" whidth="150" >이미지</td>
            <td align="center" whidth="150" >차량명</td>
            <td align="center" whidth="150" >대여일</td>
            <td align="center" whidth="60" >대여기간</td>
            <td align="center" whidth="100" >대여금액</td>
            <td align="center" whidth="60" >대여수량</td>
            <td align="center" whidth="60" >보험</td>
            <td align="center" whidth="60" >wifi</td>
            <td align="center" whidth="60" >네비게이션</td>
            <td align="center" whidth="60" >베이비시트</td>
            <td align="center" whidth="90" >삭제</td>
         </tr>
       <%
           for(int i=0; i<carlist.size(); i++){
        	   CarViewBean cbean = carlist.get(i);
       %> 
           <tr height="40">
            <td align="center" whidth="150" >
              <img src="img/<%=cbean.getImg()%>" width="120" height="70">
            </td>
            <td align="center" whidth="150" ><%=cbean.getName()%></td>
            <td align="center" whidth="150" ><%=cbean.getRday()%></td>
            <td align="center" whidth="60" ><%=cbean.getDday()%></td>
            <td align="center" whidth="100" ><%=cbean.getPrice()%>원</td>
            <td align="center" whidth="60" ><%=cbean.getCarcnt()%></td>
            <td align="center" whidth="60" ><%=cbean.getUsein()%></td>
            <td align="center" whidth="60" ><%=cbean.getUsewifi()%></td>
            <td align="center" whidth="60" ><%=cbean.getUsenavi()%></td>
            <td align="center" whidth="60" ><%=cbean.getUsebaby()%></td>
            <td align="center" whidth="90" >
               <button type="button" onclick="location.href='CarReserveDel.jsp?no=<%=cbean.getNo()%>'">삭제</button>
            </td>
         </tr> 
       
       <% } %>	   
      </table>
   </div>

</body>
</html>