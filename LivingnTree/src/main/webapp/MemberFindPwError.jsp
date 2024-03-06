<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="submit"] {
	opacity: 0;
}
</style>
</head>
<body>
	<c:if test="${msg != null}">
		<script type="text/javascript">
			alert("${msg}");
			location.href = "index.jsp?section=MemberFindPw.jsp";
		</script>
	</c:if>
	<c:if test="${msgPwq != null}">
		<form action="MemberFindPwqTemp.do" method="post">
			<input name="id" value="${mdto.m_id}" type="hidden">
        	<input name="pw" value="${mdto.m_pw}" type="hidden">
        	<input name="pwq" value="${mdto.m_pwq}" type="hidden">
        	<input name="pwa" value="${mdto.m_pwa}" type="hidden">
        	<input name="name" value="${mdto.m_name}" type="hidden">
        	<input name="postcode" value="${mdto.m_postcode}" type="hidden">
        	<input name="defaultaddr" value="${mdto.m_defaultaddr}" type="hidden">
        	<input name="detailaddr" value="${mdto.m_detailaddr}" type="hidden">
        	<input name="phone" value="${mdto.m_phone}" type="hidden">
        	<input name="email" value="${mdto.m_email}" type="hidden">
        	<input type="submit">
		</form>
		
		<script type="text/javascript">
			alert("${msgPwq}");
			/* location.href = "Main.jsp?section=MemberFindPwqTemp.do"; */
			let submit = document.querySelector("form input[type='submit']");
			submit.click();
		</script>
	</c:if>
</body>
</html>