<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {
	width: 80%;
}
</style>

</head>

<body>


	<table border="1">
		<caption>
			<h2>게시판 상세내역</h2>
		</caption>
		<tr>
			<td width="50">번호</td>
			<td>${board.b_num}</td>
		</tr>
		<tr>
			<td>말머리</td>
			<td><c:if test="${board.b_head == 1}">[공지사항]</c:if> <c:if
					test="${board.b_head == 2}">[자유]</c:if> <c:if
					test="${board.b_head == 3}">[팁]</c:if></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${board.b_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.b_content}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.b_id}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.b_date}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${board.b_readcount}</td>
		</tr>

		<tr>

			<td colspan="2"><c:if test="${sessionScope.result eq 1 }">
					<input type="button" value="수정"
						onclick="location.href='sh_boardUpdateForm.do?b_num=${board.b_num}&pageNum=${pageNum}'">
					<input type="button" value="삭제"
						onclick="location.href='sh_boardDeleteForm.do?b_num=${board.b_num}&pageNum=${pageNum}'">
				</c:if> 
				<input type="button" value="목록"
				onclick="location.href='sh_board.do?pageNum=${pageNum}'">
		</tr>
	</table>




	<!-- 댓글 본문 작성 -->
	<form
		action="sh_content.do?b_num=${board.b_num}&pageNum=${pageNum}&status=1"
		method="post">
		<table>
			<tr>
				<td width="550">
					<div>
						<textarea name="reply_content" rows="4" cols="70"></textarea>
					</div>
				</td>
			</tr>
			<!-- 댓글 등록 버튼 -->
			<tr>
				<td width="100">
					<div id="btn" style="text-align: left;">
						<input type="submit" value="등록">
					</div>
				</td>
			</tr>
		</table>
	</form>


	<!--  본문 작성  -->
	<c:forEach var="reply" items="${reply }">
		${reply.comment_id }
		${reply.comment_date }<br>
		${reply.comment_content }<br>

		<a href="sh_commentDelete.do?reply_num=${reply.comment_num }&b_num=${board.b_num}&pageNum=${pageNum}">[삭제]</a>
		<hr>
	</c:forEach>

</body>
</html>
