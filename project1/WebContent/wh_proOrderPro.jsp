<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<c:if test="${result>0}">
	<script type="text/javascript">
		alert("주문완료");
		location.href="main.do";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("주문실패");
		location.href="wh_ProContent.do?pro_num=${pro_num}&pro_code=${pro_code}";
	</script>
</c:if>
</head>
<body>

</body>
</html>