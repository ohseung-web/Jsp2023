<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  body{
      display:flex;
      justify-content: center;
   }
   .container{
      width: 350px;
      height: 600px;
   }
   h2{
      text-align: center;
   }
   table{
     border-collapse: collapse;
   }

</style>
</head>
<body>
 <div class="container">
   <h2>파일 업로드</h2>
   <form action="FileUpLoagProc.jsp" method="post"  enctype="multipart/form-data">
     <table width="350" border="1" bordercolor="gray">
        <tr height="40">
            <td width="150">이름</td>
            <td width="200"><input type="text" name="name"></td> 
        </tr>
        <tr height="40">
            <td width="150">파일 선택</td>
            <td width="200"><input type="file" name="filedata"></td> 
        </tr>
        <tr height="40">
            <td width="150" colspan="2" align="center"><input type="submit" value="파일 업로드"></td>
        </tr>
     </table>
   </form>  
</div>
</body>
</html>