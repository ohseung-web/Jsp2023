<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .productContainer{
       margin : 300px auto;
       width : 500px;
       height: 100px;
    }
    h2{
       text-align: center;
    }
    .btn{
       text-align: center;
    }
    .btn  input[type=button]{
       display : inline-block;
       text-align: center;
       width : 80px;
       height: 30px;
       cursor: pointer;
    }
</style>
</head>
<body>

    <div class="productContainer">
       <h2><b>구매를 완료하였 습니다.</b></h2>
       <div class="btn">
        <input  type="button"  value="목록보기"  onclick="location.href='RentListPro.do'">
       </div>
    </div>
   
</body>
</html>