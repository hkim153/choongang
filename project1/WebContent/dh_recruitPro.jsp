<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<c:if test="${result>0 && result2>0 && result3>0}">
	<script type="text/javascript">
		alert("입력완료");
		location.href="dh_recruitList.do";
	</script>
</c:if>
<c:if test="${result==0 && result2 ==0 && result3==0}">
	<script type="text/javascript">
		alert("입력실패");
		location.href="recruit.do";
	</script>
</c:if>
</head>
<body>

</body>
</html>