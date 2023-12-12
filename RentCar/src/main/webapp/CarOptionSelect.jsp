<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .caroption{
       width: 1000px;
       height: 550px;
       margin: 60px auto; 
    }
    #carname{
      font-size:20px;
      color:gray;
      font-weight: bold;
      text-align: center;
    }
    .select{
       width: 200px;
       height: 30px;
    }
    #btn{
        width : 150px;
        height: 30px;
        cursor: pointer;
    }
</style>
</head>
<body>
<%
     int no = Integer.parseInt(request.getParameter("no"));
     // 수량도 넘겨 받는다.
     int carcnt = Integer.parseInt(request.getParameter("Carcnt"));
     // img 가지고 오기
     String img = request.getParameter("img");
%>
<div class="caroption">
<form action="RentcarMain.jsp?section=CarReserveResult.jsp" method="post">
<table width="1000">
     <tr height="100">
        <td align="center" colspan="3" id="carname">옵션 선택</td>
     </tr>
     <tr>
         <td rowspan="7" width="500">
            <img alt="" src="img/<%=img%>" width="450">
         </td>
         <td width="250" align="left">대여기간</td>
         <td width="250" align="left" >
           <select name="dday" class="select">
              <option value="1">1일</option>
              <option value="2">2일</option>
              <option value="3">3일</option>
              <option value="4">4일</option>
              <option value="5">5일</option>
              <option value="6">6일</option>
              <option value="7">7일</option>
           </select>
         </td>
     </tr>
     <tr>
       <td width="250" align="left">대여일</td>
       <td width="250" align="left" >
         <input type="date" name="rday" class="select" id="currentDate">
       </td>
     </tr>
     <tr>
       <td width="250" align="left">보험적용</td>
         <td width="250" align="left">
            <select name="usein" class="select">
              <option value="1">적용(1일:1만원)</option>
              <option value="2">비적용</option>
           </select>
         </td>
     </tr>
     <tr>
       <td width="250" align="left">WiFi 적용</td>
         <td width="250" align="left" >
            <select name="usewifi" class="select">
              <option value="1">적용(1일:1만원)</option>
              <option value="2">비적용</option>
           </select>
         </td>
     </tr>
     <tr>
       <td width="250" align="left">네비게이션 적용</td>
         <td width="250" align="left" >
            <select name="usenavi" class="select">
              <option value="1">적용(무료)</option>
              <option value="2">비적용</option>
           </select>
         </td>
     </tr>
     <tr>
       <td width="250" align="left">베이비시트 적용</td>
         <td width="250" align="left">
            <select name="usebaby" class="select">
              <option value="1">적용(1일:1만원)</option>
              <option value="2">비적용</option>
           </select>
         </td>
     </tr>
      <tr >
       <td align="center" colspan="2">
          <input type="hidden" name="no" value="<%=no %>">
          <input type="hidden" name="carcnt" value="<%=carcnt%>">
         <input type="submit" value="차량예약하기" id="btn">
       </td>
      </tr>
   </table>
</form>   
</div>   

   <script type="text/javascript">
   
      /* toISOString() 메서드는 단순화한 확장 ISO 형식(ISO 8601)의 문자열을 반환한다. */
      /* 반환값은 언제나 24글자 또는 27글자(각각 YYYY-MM-DDTHH:mm:ss.sssZ  */
      /* 시간대는 언제나 UTC이며 접미어 Z로 표현한다. */
     
     /* 대여일자 선택시 null 에러를 미연에 방지하기 위해 오늘 날짜 출력해줌 */ 
     let today = new Date().toISOString().substring(0, 10); 
     document.getElementById("currentDate").value = today ;
    
   </script>

</body>
</html>