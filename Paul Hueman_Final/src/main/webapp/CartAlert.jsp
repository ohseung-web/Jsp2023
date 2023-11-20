<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${msg == 'del'}">
	<script>
		window.alert("선택하신 상품이 삭제되었습니다.");
	</script>
</c:when>
<c:when test="${msg == 'udt'}">
	<script>
		window.alert("선택하신 상품의 수량이 수정되었습니다.");
	</script>
</c:when>
</c:choose>