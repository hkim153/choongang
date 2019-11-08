<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}
</style>
</head>
<body>

<div class="wrap">
	<header> <jsp:include page="header.jsp"></jsp:include> </header>

	<a href="hs_addFishingSiteForm.do">낚시터 추가하기</a><p>
	<a href="hs_userPreferForm.do">낚시터 추천</a>
	<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

		</div>
</body>
</html>