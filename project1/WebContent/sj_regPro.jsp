<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result>0 }">
<script type="text/javascript">
	alert("입력 완료");
	location.href="fishingking.do?id=${id}&num=${num}";
</script>
</c:if>
<c:if test="${result==0 }">
<script type="text/javascript">
	alert("입력 실패");
	location.href="fishingking.do?id=${id}";
</script>
</c:if>
</body>
</html>