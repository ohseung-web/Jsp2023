<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<form action="Jang.do"   method="post">
      <table width="1000">
        <tr height="100">
        <td align="center" colspan="3">
           <font size="5"   color="gray">${name } 차량 선택</font>
        </td>
        </tr>   
       <tr>
           <td rowspan="6"  width="500">
               <img alt="" src="img/${img }" width="450">
            </td>
             <td width="250"  align="center">차량이름</td>
              <td width="250"  align="center">${name }</td>  
          </tr>
           <tr>
                <td width="250"  align="center">차량수량</td>
                <td width="250"  align="center">
                <select  name="cnt">
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3">3</option>
                </select>
                </td>
              </tr>
                 <td width="250"  align="center">대여가격</td>
                  <td width="250"  align="center">${price }원</td> 
               </tr>
               <tr>
                 <td width="250"  align="center">제조회사</td>
                  <td width="250"  align="center">${company }</td> 
               </tr>
                <tr>
                 <td align="center" colspan="2">
                   <input type="hidden"  name="no"  value="${no }">
                   <input type ="hidden"  name="img"  value="${img }" >
                   <input type ="hidden"  name="name"  value="${name }" >
         <%--           <input type ="hidden"  name="qty"  value="${cnt }" > --%>
                   <input type ="hidden"  name="price"  value="${price }" >
                   <input type="submit"  value="장바구니 담기">&nbsp;&nbsp;
                   <input type="button"   value="목록보기" onclick="location.href='RentListPro.do'">
                 </td>
                 </tr>
     </table>
</form>
</center>

</body>
</html>












