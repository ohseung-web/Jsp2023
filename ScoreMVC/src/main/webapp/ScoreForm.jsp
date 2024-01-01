<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
       #student {  width : 600; height:600; align-content: center; line-height: 50px; }
       .te {width : 120px; height:30px;}
       .btn{border: 1px solid : darkgray; border-color: darkgray; width : 100px; height:30px}
</style>
</head>
<body>
<center>
   <form action="score.do"  method="post">
       <h2>3개 과목의 성적을 입력하여 주세요</h2>
       <hr>
   <div id="student" >
     <span>  학     번  :  </span><input type="text"  name="num" class="te"><br>    
     <span>  이     름  :  </span><input type="text"  name="name" class="te"><br>
     <span>  과목1  :  </span><input type="text"  name="sub1" class="te"><br>
     <span>  과목2  :  </span><input type="text"  name="sub2" class="te"><br>
     <span>  과목3 :  </span><input type="text"  name="sub3" class="te"><br>
       <input type="submit"  value="입력하기" class="btn">&nbsp; &nbsp;
       <input type="reset"  value="취소하기" class="btn">&nbsp; &nbsp;
       <input type="button"  value="목록보기" class="btn" onclick="location.href='scoreListProc.do'"><br>
    </div> 
   </form>

</center>
</body>
</html>