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
	<input type = "hidden" name="b_id" value ="${sessionScope.id }">
   <table>
	<caption><h2>게시판 글쓰기</h2></caption>
	<tr>
		<td>말머리</td>
		<td><input type="text" name="b_head" list="choices" required="required">
			<datalist id = "choices">
				<option value="공지"></option>
				<option value="자유"></option>
				<option value="팁"></option>
			</datalist>
		</td>
	</tr>
	<tr><td>제목</td><td><input type="text" name="b_title" required = "required"></td></tr>
	<tr><td>작성자</td><td>${sessionScope.id}</td></tr>

	<tr><td>내용</td><td><textarea rows="10" cols="30" name="b_content" 
		required="required"></textarea></td></tr>

	<tr><td><input type="submit" value="확인"></td>
		<td><input type="reset" value="다시작성"></td></tr>
  </table>
</form>
</body>
</html>