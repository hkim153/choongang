<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낚시터 로그인 체크</title>
<link href="test.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<!-- 로그인 안했을 경우 로그인 창으로 이동 -->
		<c:if test="${sessionScope.result ne 1 }">
			<script type="text/javascript">
				alert("로그인 해주세요");
				location.href = "jw_loginForm.do";
			</script>
		</c:if>
		<!-- 로그인 했을 경우 낚시터 사이트로 이동 -->
		<c:if test="${sessionScope.result eq 1 }">
			<script type="text/javascript">
				location.href = "hs_fishingSitePro.do";
			</script>
		</c:if>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>