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
      <h2>학생 개인정보</h2>
     
      <table width="600"  border="1">
       <form action="studentUpdate.do" method="post">
         <tr height="40">
               <td align="center"  width="120">학번</td>
               <td align="center"  width="180" >${num }
              </td>
          </tr> 
         <tr height="40">
               <td align="center"  width="120">이름</td>
               <td align="center"  width="180">${name }</td>
          </tr>     
        <tr height="40">
               <td align="center"  width="120">과목1</td>
               <td align="center"  width="180">
               <input type="text"  name ="sub1"  value="${sub1 }" /></td>
          </tr>   
          <tr height="40">
              <td align="center"  width="120">과목2</td>
               <td align="center"  colspan="3" >
               <input type="text"  name ="sub2"  value="${sub2 }" /></td>
           </tr>  
           <tr height="40">
              <td align="center"  width="120">과목3</td>
               <td align="center"  colspan="3" >
               <input type="text"  name ="sub3"  value="${sub3 }" />
               </td>
           </tr>  
            <tr height="40">
              <td align="center"  width="120">총점</td>
               <td align="center"  colspan="3">${total }</td>
           </tr>   

            <tr height="40">
              <td align="center"  width="120">평균</td>
               <td align="center"  colspan="3">${average }</td>
           </tr>   

            <tr height="40">
              <td align="center"  width="120">학점</td>
               <td align="center"  colspan="3">${grade }</td>
           </tr>   
           <tr height="40">  
            <td align="center"  colspan="4">
             <input type="hidden"  name="num"  value="${num }">
             <input type="submit"   value="수정">
             <input type="button"  value="삭제"  onclick="location.href='scoreDelete.do?num=${num}'">
            <input type="button"   value="목록보기"  onclick="location.href='scoreListProc.do'">
           </td> 
            </tr>
            </form>
      </table>
 </center>   
</body>
</html>