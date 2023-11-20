<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paul Hueman</title>
<link rel="stylesheet" href="css/boardlist.css?ver=1">
</head>
<body>
	<div id="boardlist">
		<div id="list_main">
			<div id="list_main_top">
				<h2>Q&amp;A</h2>
				<p>
					폴휴먼과 관련된 궁금한 사항은 무엇이든 물어보세요 <br>
					고객님의 소중한 의견을 남겨주시면 접수후 빠른 대응을 하도록 하겠습니다.
				</p>
			</div>
			<div id="list_main_mid">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
					</tr>
					<c:choose>
						<c:when test="${not empty a }">
							<c:forEach var="a" items="${a}">
								<tr>
									<td>${a.b_no}</td>
									<td><a href="GetOneBoard.do?b_no=${a.b_no}">${a.b_subject}</a></td>
									<td>${a.u_id}</td>
									<td>${a.b_date }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4"><span class="nothing">게시글이 없습니다.</span></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<div id="write_button">
				<button onclick="location.href='Main.jsp?section=InsertBoard.jsp'">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>