<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 80%;
}
</style>
</head>
<body>
<form action="hh_updatePro.do" method="post">
<input type="hidden" name="e_id" value="${event.e_id}">
<input type="hidden" name="pageNum" value="${pageNum}">
<table border="1">
		<caption><h2>게시판 수정</h2></caption>
		<tr><td width="20">번호</td><td>${event.e_id}</td></tr>
		<tr><td>제목</td><td><input type="text" name="title" required="required" value="${event.title}"></td></tr>
		<tr><td>타입</td><td><input type="text" name="e_type" required="required" value="${event.e_type}"></td></tr>
		<tr><td>시작날자</td><td><input type="date" name="e_start" required="required" value="${event.e_start}"></td></tr>
		<tr><td>종료 날자</td><td><input type="date" name="e_end" required="required" value="${event.e_end}"></td></tr>
		<tr><td>장소</td><td><input type="text" name="rsa" required="required" value="${event.rsa}"></td></tr>
		<tr><td>url</td><td><input type="text" name="url" " value="${event.url}"></td></tr>
		<tr><td>내용</td><td><textarea rows="10" cols="40" name="description" required="required">${event.description}</textarea></td></tr>
		<tr><td colspan ="2">
		<input type="submit" value="수정 완료"></td></tr>
	</table>
	
</form>
</body>
</html>