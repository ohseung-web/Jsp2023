<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${null ne overlapId}"> <!-- overlapId != null -->
		<script>
			alert("${overlapId}");
			history.back();
		</script>
	</c:if>

	<c:if test="${null ne loginfail}">
		<script>
			alert("${loginfail}");
			history.back();
		</script>
	</c:if>	
	
	<c:if test="${null ne cartsuccess}">
		<script>
			alert("${cartsuccess}");
			//location.href="MainList.do";
			//history.back();
			location.href="MainList.do?section=Onelist.jsp";
		</script>
	</c:if>	
	
	<c:if test="${null ne buysuccess}">
		<script>
			alert("${buysuccess}");
			location.href="MainList.do?section=PurchaseDetail.jsp";
		</script>
	</c:if>	
	
	<c:if test="${null ne alreadyexist}">
		<script>
			alert("${alreadyexist}");
			history.back();
		</script>
	</c:if>	
	
	<c:if test="${null ne pwchangesuccess}">
		<script>
			alert("${pwchangesuccess}");
			location.href = "Main.jsp?section=MemberInfo.jsp";
			self.close();
		</script>
	</c:if>	
	
	<c:if test="${null ne pwchangefail}">
		<script>
			alert("${pwchangefail}");
			history.back();
		</script>
	</c:if>	
	
	<c:if test="${null ne orderfail}">
		<script>
			alert("${orderfail}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne withdrawsuccess}">
		<script>
			alert("${withdrawsuccess}");
			location.href="MainList.do";
		</script>
	</c:if>	
	
	<c:if test="${null ne withdrawfail}">
		<script>
			alert("${withdrawfail}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne samepwchangefail}">
		<script>
			alert("${samepwchangefail}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne pwsamefail}">
		<script>
			alert("${pwsamefail}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne chooseoption}">
		<script>
			alert("${chooseoption}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne infochangesuccess}">
		<script>
			alert("${infochangesuccess}");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${null ne joinsuccess}">
		<script>
			alert("${joinsuccess}");
			location.href="MainList.do";
		</script>
	</c:if>
	
	<c:if test="${null ne loginessential}">
		<script>
			alert("${loginessential}");
			location.href="MainList.do?section=${section}";
		</script>
	</c:if>
	
	<c:if test="${null ne findidfail}">
		<script>
			alert("${findidfail}");
			history.back();
		</script>
	</c:if>
	
</body>
</html>