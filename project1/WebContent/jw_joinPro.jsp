<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result ==1}">
	<script type="text/javascript">
	alert("회원이 되신걸 환영합니땅! ^ㅡ^");
	location.href="jw_loginForm.do";
	</script>
</c:if>
<c:if test="${result !=1 }">
	<script type="text/javascript"> 
	alert("정보를 잘못입력하셨습니땅! ㅠㅡㅠ");
	location.href="jw_joinForm.do";
	</script>
</c:if>
</body>
</html>