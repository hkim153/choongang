<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function wincl() {
		window.close();
	}
</script>
</head>
<body>

<%-- <c:set var="id" value="${id }"></c:set> --%>
<%-- <input type="hidden" name="id" value=" ${id }"> --%>
	<c:if test="${result==1 }">
			<p1>${id } 는 이미 있는 아이디입니땅! 다른 아이디를 사용하셔야 합니땅!</p1>
	</c:if>
	<c:if test="${result !=1 }">
		<p1>	${id } 는 사용하실 수 있습니땅!</p1>
	</c:if>
	
<p><input type="button" value="확인" onclick="wincl()">
</body>
</html>