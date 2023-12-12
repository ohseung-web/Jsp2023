<%@page import="java.text.DecimalFormat"%>
<%@page import="db.CarListBean"%>
<%@page import="db.RentCarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
   #reserveImg{
      margin : 20px 0;
      width: 400px;
      height: 300px;
   }
</style>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
  <jsp:setProperty name="rbean" property="*" />
</jsp:useBean>

<!-- 로그인 후 옵션선택 가능하도록 작성-->
<%
   String id = (String)session.getAttribute("id");
   
   if(id == null){
%>
   <script type="text/javascript">
      alert("로그인 후 예약이 가능합니다.");
      location.href='RentcarMain.jsp?section=MemberLogin.jsp';
   </script>
<%
   }
   //날짜 비교 (오늘 이전의 날짜는 선택할 수없댜)
   Date rday = new Date(); // 대여일
   Date today = new Date(); // 오늘날짜
   
   //날짜를 변환해주는 클래스 선언
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
   DecimalFormat dcf = new DecimalFormat("#,##0");
   
	   rday = sdf.parse(rbean.getRday());
	   today = sdf.parse(sdf.format(today));
 
   //날짜비교 메소드를 사용가능해 진다.
   int compare = rday.compareTo(today);
   //예약하려는 날짜보다 오늘날짜가 크다면 -1이 넘어옴
   //예약하려는 날짜가 오늘날짜 보다 크거나 같으면 1이 넘어몸;
    
  if(compare < 0) { // 예약불가
	   %>
	   <script type="text/javascript">
	      alert("현재 날짜보다 이전날짜는 선택불가 합니다.");
	      history.go(-1);
	   </script>
	<%   
      }
       
      // 결과 적으로 아무런 문제가 없다면 데이터를 저장 후 결과페이지 보여주기
      // id 값이 빈클래스에 존재하지 않기때문에 
      
      String dbId = (String)session.getAttribute("id");
      rbean.setId(dbId);
      
      //데이터 베이스에 빈클래스를 저장
      RentCarDAO rdao = new RentCarDAO();
      rdao.setReserveCar(rbean);
      
      //차량 정보 얻어오기 : 차량이미지 가져오기 위해 작성
      CarListBean cbean = rdao.getOneCar(rbean.getNo());
      // 차량 총예약 금액
      int totalcar = cbean.getPrice()*rbean.getCarcnt()*rbean.getDday() ;
      
      int usein = 0;
      if(rbean.getUsein()==1) usein = 10000; //보험
      int usenavi = 0;
      if(rbean.getUsenavi()==1) usenavi = 10000; //wifi
      int usebaby = 0;
      if(rbean.getUsebaby()==1) usebaby = 10000; //베이비시트
      
    //옵션 금액
      int totaloption = rbean.getCarcnt()*rbean.getDday()*(usein + usenavi + usebaby);
   %>
 
   <div class="reserve">
      <h2>차량 예약 완료 화면</h2>
      <table width="1000">
         <tr>
            <td align="center" ><img src="img/<%=cbean.getImg()%>" id="reserveImg"></td>
         </tr>
         <tr height="50">
           <td align="center" >차량 총에약 금액 <%=dcf.format(totalcar)%>원</td>
         </tr>
          <tr height="50">
            <td align="center" >차량 총옵션 금액 <%=dcf.format(totaloption)%>원</td>
         </tr>
         </tr>
          <tr height="50">
           <td align="center" >차량 총금액 <%=dcf.format(totaloption + totalcar)%>원</td>
         </tr>
      </table>
   </div>
</body>
</html>