<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<table border="1">
		<caption><h2>게시판 상세내역</h2></caption>
		<tr><td width="20">번호</td><td>${event.e_id}</td></tr>
		<tr><td>제목</td><td>${event.title}</td></tr>
		<tr><td>내용</td><td>${event.description}</td></tr>
		<tr><td>시작날자</td><td>${event.e_start}</td></tr>
		<tr><td>종료 날자</td><td>${event.e_end}</td></tr>
		<tr><td>타입</td><td>${event.e_type}</td></tr>
		<tr ><td colspan ="2">
		<input type="button" value="수정"
				onclick="location.href='hh_updateForm.do?e_id=${event.e_id}&pageNum=${pageNum }'">
		<input type="button" value="삭제"
				onclick="location.href='hh_deleteForm.do?e_id=${event.e_id}&pageNum=${pageNum }'">
		<input type="button" value="목록"
				onclick="location.href='hh_list.do?pageNum=${pageNum}'"></td></tr>
	</table>

</body>
</html>