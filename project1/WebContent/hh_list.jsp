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
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css"> 
table {	   width: 100%;   }
</style>
</head>
<body>
<input type="button" value="달력이동" onclick="location.href='hh_event.do'">
	<h2>게시판</h2>
	<table><tr><td><a href="hh_writeEventForm.do?chk=0">글쓰기</a></td></tr></table>
	<!-- 업데이트 이벤트시 db 에 있는 데이터 들을 json 파일을 새로 만듦.// (제보) 표시 사항들은 (제보)표시를 버리고 json에 반영
	json 파일은 브라우저 내부로 들어가기 때문에 방문 기록을 삭제 해야 달력에서 확인 가능. -->
	<table><tr><td><a href="hh_CalenderUpdate.do">달력 업데이트</a></td></tr></table>
	<form action="hh_massdelete.do">
	<table>
		<tr>
			<th>번호<input type="submit" value="일괄 삭제"> </th><th>제목</th><th>내용</th><th>시작날자</th><th>종료 날자</th>
			<th>타입</th><th>위치</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="event" items="${list }">
				<tr>
					<td>${startNum }<input type="checkbox" name="delf" value="${event.e_id }"></td>
					<td class="left" width=200>
						 <a href='hh_content.do?e_id=${event.e_id}&pageNum=${currentPage}'>
							${event.title}</a></td>
					<td>${event.description}</td>
					<td>${event.e_start}</td>
					<td>${event.e_end}</td>
					<td>${event.e_type}</td>
					<td>${event.rsa}</td>
					<td><input type="hidden" value="${event.url}">
					</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr><td colspan=7>데이터가 없네</td></tr>
		</c:if>
	</table></form>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='hh_list.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='hh_list.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='hh_list.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>