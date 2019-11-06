<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<div id ="upright">
		<a href="main.do">홈으로</a>
		<a href="hs_fishingSiteForm.do">낚시터 홈으로</a>
		<a href="jw_logOut.do">로그아웃하기</a>
</div>

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

</body>
</html>