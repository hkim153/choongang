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
<form action="sh_boardWritePro.do?pageNum=${pageNum}" method="post">
   <input type="hidden" name="f_board_no" value="${f_board_no}">


   <table>
	<caption><h2>게시판 글쓰기</h2></caption>
	<tr><td>제목</td><td><input type="text" name="f_board_title" required = "required"></td></tr>
	<tr><td>작성자</td><td>${sessionScope = ID}</td></tr>

	<tr><td>내용</td><td><textarea rows="10" cols="30" name="f_board_content" 
		required="required"></textarea></td></tr>
	<tr><td>암호</td><td><input type="password" name="f_board_pass" required="required"></td></tr>
	<tr><td><input type="submit" value="확인"></td>
		<td><input type="reset" value="다시작성"></td></tr>
  </table>
</form>
</body>
</html>