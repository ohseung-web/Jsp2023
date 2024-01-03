
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
    table{
      border-collapse: collapse;
    }
    h2{
      text-align: center;
    }
    table tr td input{
       width:400px;
       height: 25px;
       margin-left: 3px;
    }
    table tr td input[type=submit],
    table tr td input[type=reset],
    table tr td input[type=button]
    {
       width: 120px;
       cursor: pointer;
       margin-left:0;
    }
    button{
      cursor: pointer;
    }
    textarea{
       margin-left: 20px;
    }
</style>
</head>
<body>
 <div class="container">
   <h2>답변글 입력하기</h2>
   <form action="BoardReWriterProcCon.do" method="post" name="formname">
      <table width="600" border="1">
         <tr height="40">
            <td align="center" width="150">작성자</td>
            <td align="center" width="450"><input type="text" name="writer" ></td>
         </tr>
         <tr height="40">
            <td align="center" width="150">제목</td>
            <td align="center" width="450"><input type="text" name="subject" value="[답변]" class="resubject"></td>
         </tr>
         <tr height="40">
            <td align="center" width="150">이메일</td>
            <td align="center" width="450"><input type="email" name="email" ></td>
         </tr>
         <tr height="40">
            <td align="center" width="150">비밀번호</td>
            <td align="center" width="450"><input type="password" name="password"></td>
         </tr>
         <tr height="40">
             <td align="center" width="150">글내용</td>
             <td width="450"><textarea rows="10" cols="55" name="content" class="recontent"></textarea>
          </tr>
          <!-- form에서 사용자로 부터 입력받지 않고 데이터 넘기기 -->
          <tr height="40">
             <td align="center" colspan="2">
                <input type="hidden" name="ref" value="${ref }">
                <input type="hidden" name="re_step" value="${re_step }">
                <input type="hidden" name="re_level" value="${re_level }">
                <input type="button" onclick="boardReWrite()" value="답글쓰기완료">&nbsp;&nbsp;
                <input type="reset"  value="취소">&nbsp;&nbsp;
                <input type="button" value="전체 게시글보기" onclick="location.href='BoardListCon.do'">
             </td>
          </tr>
      </table>
   </form>
 </div>
 <script type="text/javascript">
     
    /* forward를 이용하여 페이지 이동시 새로고침문제로 계속 insert되는 현상을 막기 위해 submit을 자바스크립트에서 하기로 한다. */
    let formname = document.formname
	let sub = document.getElementsByClassName("resubject")[0];
    let content = document.getElementsByClassName("recontent")[0];
    
    function boardReWrite(){
    	if(!sub.value){
    		alert("제목을 입력하세요");
			sub.focus();
			return;
    	}
    	if(!content.value){
    		alert("내용을 입력하세요");
    		content.focus();
    		return;
    	}
    	
    	formname.submit();
    	
    }
 </script>
</body>
</html>