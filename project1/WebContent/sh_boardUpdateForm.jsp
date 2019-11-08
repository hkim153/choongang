<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head><body>
<form action="sh_boardUpdatePro.do" method="post">
		<input type="hidden" name="f_board_no" value="${board.f_board_no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table border="1">
			<caption><h2>게시판 수정</h2></caption>
			<tr><td>번호</td><td>${board.f_board_no}</td></tr>
			<tr><td>제목</td><td><input type="text" name="f_board_title" required="required"
			 value="${board.f_board_title}"></td></tr>
			<tr><td>작성자</td><td><input type="text" name="f_board_id" required="required"
			 value="${board.f_board_id}"></td></tr>
			<tr><td>암호</td><td><input type="password" name="f_board_pass" required="required"
				 value="${board.f_board_pass}"></td></tr>
			<tr><td>내용</td><td><pre><textarea rows="10" cols="40" name="f_board_content"
				required="required">${board.f_board_content}</textarea></pre></td></tr>
			<tr><td colspan="2"><input type="submit" value="수정완료" >
				</td></tr>
		</table>
</form>
</body>
</html>