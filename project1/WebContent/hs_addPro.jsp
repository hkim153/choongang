<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("입력 완료");  
		location.href="hs_addFishingSiteForm.do?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0 }">  
	<script type="text/javascript">
		alert("입력실패");  
		location.href="hs_addForm.do?pageNum=${pageNum}";
	</script>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>

		</div>
</body>
</html>