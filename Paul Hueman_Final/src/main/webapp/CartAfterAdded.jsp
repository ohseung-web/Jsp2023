<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${status == 'success'}">
	<script>
		window.alert("상품이 추가되었습니다.");
	</script>
</c:when>
<c:when test="${status == 'countover'}">
	<script>
		window.alert("구입 가능한 수량을 초과하셨습니다.(1-9999)");
	</script>
</c:when>
<c:when test="${status == 'logerror'}">
	<script>
		if(window.confirm("로그인이 필요합니다.\n지금 로그인 하시겠습니까?")) location.href = "Main.jsp?section=Login.jsp";		
	</script>
</c:when>
</c:choose>