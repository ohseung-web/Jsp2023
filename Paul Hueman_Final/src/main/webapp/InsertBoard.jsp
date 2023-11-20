<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paul Hueman</title>
<link rel="stylesheet" href="css/InsertBoard.css?ver=1">
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
			<div id="list_main_write">
				<form action="InsertBoardProc.do" method="post" name="formname">
					<table>
						<tr>
							<th>상담유형</th>
							<td>
								<select name="bro" class="bro">
									<option value="">유형선택</option>
									<option value="[배송]">배송</option>
									<option value="[상품]">상품</option>
									<option value="[AS]">AS</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="b_subject" class="b_subject">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="b_contents" class="b_contents"></textarea>
							</td>
						</tr>
					</table>
					<div id="last_button">
						<input type="button" onclick="Bnull();" value="등록">
						<input type="button" onclick="location.href='BoardListProc.do'" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function Bnull(){
			var formname = document.formname
			var bro = document.getElementsByClassName("bro")[0];
			var sub = document.getElementsByClassName("b_subject")[0];
			var cont = document.getElementsByClassName("b_contents")[0];
			if(!bro.value){
				alert("유형을 선택하세요");
				bro.focus();
				return;
			}
			if(!sub.value){
				alert("제목을 입력하세요");
				sub.focus();
				return;
			}
			if(!cont.value){
				alert("내용을입력하세요");
				cont.focus();
				return;
			}
			formname.submit();
		}
	</script>
</body>
</html>