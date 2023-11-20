<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paul Hueman</title>
<link rel="stylesheet" href="css/OneBoard.css?ver=1">
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
			<div id="OneBoard">
				<form action="ChangeBoard.do" method="post">
					<table>
						<tr>
							<th>${b_subject}</th>
							<th>작성일 &nbsp;${b_date}</th>
							<th>작성자&nbsp;${u_id}</th>
						</tr>
						<tr>
							<td colspan="3">${b_contents}</td>
						</tr>
					</table>
					<div id="buttons">
						<div id="button1">
							<input type="hidden" name="b_no" value="${b_no}">
							<input class="dark_button" type="button" value="글쓰기" onclick="location.href='Main.jsp?section=InsertBoard.jsp'">
							<input class="white_button" type="submit" value="수정">
							<input class="white_button" type="button" value="삭제" onclick="location.href='DeleteBoard.do?b_no=${b_no}&u_id=${u_id}'">
						</div>
						<div id="button2">
							<input class="dark_button" type="button" value="목록" onclick="location.href='BoardListProc.do'">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>