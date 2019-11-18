<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrap">
<header> <jsp:include page="header.jsp"></jsp:include> </header>
<div class="container">
<form action="jw_outPro.do" method="post">
<input type="hidden" name="id" value="${sessionScope.id }">
<h3>탈퇴하시겠습니까?</h3>
<input type="password" name="passwd" placeholder="비밀번호를 입력해주세요">
<input type="submit" value="탈퇴하기" >
<input type="button" value="돌아가기" onclick="location.href='main.do'">
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>