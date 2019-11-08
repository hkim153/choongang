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

<h2>삭제하려면 암호를 입력하세요</h2>
<form action="hs_deletePro.do">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name = "id" value = "${fs.id }">
	<input type="hidden" name = "curid" value = "${sessionScope.id }">
	<input type="hidden" name = "rightpasswd" value = "${sessionScope.passwd}">
	작성자 : ${fs.id }<p>
	암호 : <input type="password" name="passwd"><p>
	<input type="submit" value="확인">
</form>
<jsp:include page="footer.jsp"></jsp:include>

		</div>
</body>
</html>