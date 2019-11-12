<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="test.css" rel="stylesheet" type="text/css">


</head>
<body>
 <div class="wrap">
	 <header> <jsp:include page="header.jsp"></jsp:include> </header>
	
	<table>
		<tr>
			<c:if test="${sessionScope.result eq 1 }">
			<td><a href="sh_boardWriteForm.do?pageNum=${pageNum}">글쓰기</a></td>
			</c:if>
		</tr>
		<tr>
			<th>번호</th>
			<th>말머리</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>
						<c:if test="${board.b_head==1}">[공지사항]</c:if>
						<c:if test="${board.b_head==2}">[자유]</c:if>
						<c:if test="${board.b_head==3}">[팁]</c:if>
					</td>
					<td class="left" width=200><a
						href="sh_content.do?b_num=${board.b_num}&pageNum=${currentPage}&status=0">
							${board.b_title}</a></td>
					<th>${board.b_content}</th>
					<th>${board.b_id}</th>
					<th>${board.b_date}</th>
					<th>${board.b_readcount}</th>
				</tr>
				</tbody>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	<form method="get" action="sh_board.do">
		<div> 			
			<select name="searchType">
				<option value="01" <c:if test="${empty searchType or searchType eq 01}">selected="selected"</c:if>>제목</option>
				<option value="02" <c:if test="${searchType eq 02}">selected="selected"</c:if>>제목+내용</option>
				<option value="03" <c:if test="${searchType eq 03}">selected="selected"</c:if>>작성자</option>
			</select>
			<input type="text" name="searchText" value="${searchText}">
			<input type="submit" value="검색" />
		</div>	
	</form>
	
	
 
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='sh_board.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='sh_board.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='sh_board.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	 <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>