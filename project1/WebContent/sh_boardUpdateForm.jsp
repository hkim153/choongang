<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>

</head><body>
<form action="sh_boardUpdatePro.do" method="post">
		<input type="hidden" name="b_num" value="${board.b_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table border="1">
			<caption><h2>게시판 수정</h2></caption>
			<tr><td>번호</td><td>${board.b_num}</td></tr>
			<tr>
				<td>말머리</td>
				<td>
					<c:if test="${board.b_head == 1}">[공지사항]</c:if>
					<c:if test="${board.b_head == 2}">[자유]</c:if>
					<c:if test="${board.b_head == 3}">[팁]</c:if>
				</td>
			</tr>	
			<tr><td>제목</td><td><input type="text" name="b_title" required="required"
			 value="${board.b_title}"></td></tr>
			<tr><td>작성자</td><td>${board.b_id}</td></tr>
			
			<tr><td>내용</td><td><pre><textarea rows="10" cols="40" name="b_content"
				required="required">${board.b_content}</textarea></pre></td></tr>
			<tr><td colspan="2"><input type="submit" value="수정완료" >
			</td></tr>
				
		</table>
</form>
</body>
</html>