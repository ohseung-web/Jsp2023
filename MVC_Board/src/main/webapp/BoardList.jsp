<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    a{
      text-decoration: none
    }
    p{
       text-align: center;
    }
    .pageing{
       width : 200px;
       text-align: center;
       margin : 10px auto;
    }
    #subject{
       padding-left: 10px;
    }
</style>
</head>

<%-- <c:if test="${msg != null } && ${msg eq '0' }"> --%>
<c:if test="${msg != null }">
  <script type="text/javascript">
     alert("비밀번호를 확인하세요");
  </script>  
</c:if>

<div class="container">
	<h2>게시글 보기</h2>
	<table width="700" border="1">
		<tr height="40">
			<td colspan="5" align="right">
				<button type="button" onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
			</td>
		</tr>
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="320" align="center">제목</td>
			<td width="100" align="center">작성자</td>
			<td width="150" align="center">작성일자</td>
			<td width="80" align="center">조회수</td>
		</tr>
		
		<c:set var="number" value="${number}" />
		<c:forEach var="bdto" items="${alist}">
		       <!--  number는 최신글 순서로 화면에 출력하는 변수이다. 고로 number는 1씩 감소하여야 하기 때문에 number 변수를 작성한다.  -->
			  <tr height="40">
				<td width="50" align="center">${number}</td>
				<!-- 제목은 Re_step에 따라서 앞 부분에 들여쓰기를 하여야 한다.  -->
				<!-- re_step이 1이면 들여쓰기를 할 필요가 없기때문에 re_step >1 클때 들여쓰기 하라고 조건을 지정한다.  -->
				<td width="320" align="left" id="subject">
				   <c:if  test="${bdto.re_step > 1 }">
						<c:forEach var="j" begin="1" end="${(bdto.re_step-1)*3}">
                          &nbsp;
                        </c:forEach>
				   </c:if> 
				 <a href="BoardInfoControl.do?num=${bdto.num}"> ${bdto.subject}</a>
				</td>
				<td width="100" align="center">${bdto.writer}</td>
				<td width="150" align="center">${bdto.reg_date}</td>
				<td width="80" align="center">${bdto.readcount}</td>
			 </tr>
			<!-- number-1을 이용하여 1씩 감소한다.  number=10이면 다음 number=9가된다 -->
			<c:set var="number" value="${number - 1 }" />
		</c:forEach>
    </table>
	
	<div class="pageing">
		<!-- 페이지 카운터링 소스 작성 [1] [2] [3] [다음] ....... -->

		<!-- [이전]이라는 링크를 만들건지 파악-->
		<c:if test="${startPage > pageBlock }">
			<a href="BoardListCon.do?pageNum=${startPage - pageBlock}"> [이전]
			</a>
		</c:if>

		<!-- 페이징 처리 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="BoardListCon.do?pageNum=${i}"> [${i}] </a>
		</c:forEach>

		<!-- [다음]이라는 페이지를 만들건지 파악 -->
		<c:if test="${endPage < pageCount }">
			<a href="BoardListCon.do?pageNum=${startPage + pageBlock}"> [다음]
			</a>
		</c:if>
	</div>
	
</div>
</body>
</html>