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
      <h2>답변을 입력하기</h2>
 <%
        request.setCharacterEncoding("UTF-8");
        //boradifo에서 get방식으로 넘겨받은 num, ref, re_step, re_level getParameter 한다.
        //게시글 읽기에서 답변글쓰기를 클릭하면 넘겨주는 데이터들을 받아줌
        
        int num = Integer.parseInt(request.getParameter("num"));
        int ref = Integer.parseInt(request.getParameter("ref"));
        int re_step = Integer.parseInt(request.getParameter("re_step"));
        int re_level = Integer.parseInt(request.getParameter("re_level"));   
 %>     
 <!--  폼을 만들고 데이터 입력받아서 DAO클래스를 호출하여 저장하는 태그를 작성한다. -->
 <form action="BoardReWriteProc.jsp"  method="post">
      <table width="600"  border="1"  bgcolor="skyblue">
         <tr height="40">
             <td width="150"  align="center" >작성자</td>
             <td width="450" ><input type="text" name="writer" size="60"></td> 
           </tr>
           <tr height="40">
             <td width="150"  align="center" >제목</td>
             <td width="450" ><input type="text" name="subject"  value="[답변]" size="60"></td> 
           </tr>
           <tr height="40">
             <td width="150"  align="center" >이메일</td>
             <td width="450" ><input type="email" name="email" size="60"></td> 
           </tr>
           <tr height="40">
                <td align="center" width="150">비밀번호</td>
                <td  width="450"><input type="password" name="password" size="60"></td>
            </tr>  
            <tr height="40">
                <td align="center" width="150">글내용</td>
                <td  width="450"><textarea rows="10" cols="50"  name="content"></textarea></td>
            </tr>  
            <!--form에서 사용자로부터 입력받지않고 데이터를 넘김  -->
             <tr height="40">
                <td align="center"  colspan="2">
                  <input type="hidden" name="ref" value="<%=ref%>">
                  <input type="hidden" name="re_step" value="<%=re_step%>">
                  <input type="hidden" name="re_level" value="<%=re_level%>">
                  <input type="submit" value="답글쓰기완료">&nbsp;&nbsp;
                  <input type="reset" value="다시작성">&nbsp;&nbsp;
                  <button onclick="BoardList.jsp">전체 게시글보기</button>
                </td>
            </tr>           
       </table>
 </form>
      
</body>
</html>