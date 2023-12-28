<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
  <h2>장바구니</h2>
   <hr>
 <form action ="RentDeletePro.do"   method="post">
   <table width="800" border="1">
     <tr height="40">
       <td align="center"  width="10">체크</td>
      <td align="center" width="50">상품번호</td>
      <td align="center" width="50">상품명</td>
      <td align="center" width="50">상품수량</td>
      <td align="center" width="50">상품가격</td>
      <td align="center" width="50">총금액</td>
     </tr>
    
       <c:forEach  var="jdto"  items="${a }">
       <tr height="40">
         <td align="center"  width="10">
         <input type="checkbox"  name="chk" value="${jdto.no}"></td>
        <td align="center" width="50" >${jdto.no }</td>
        <td align="center" width="50">
          <img alt="" src="img/${jdto.img }" width="60"  height="60"></td>
          <td align="center" width="50" >      
             <input type="text"  value="${jdto.cnt }"  name="cnt"  size="2"  id="jangcnt">개              
              <input type="button"   value="수정"  onclick="location.href='RentUpdate.do?no=${jdto.no }&cnt=${qty }'"> 
           </td>
        <td align="center" width="50">${jdto.price }</td>
        <td align="center" width="50">${jdto.price * jdto.cnt }</td>
       </tr> 
       </c:forEach>
       
       <tr height="40">
       <td align="center" colspan="6">
        <input type="submit"   value="삭제" >
       <input type="button"   value="목록보기" onclick="location.href='RentListPro.do'">
       </td>
   </table>
   </form>
 </center> 
 <script>
       var qty = document.getElementById("jangcnt").value;
       var cnt = qty;
       console.log(cnt);
 </script>

</body>
</html>