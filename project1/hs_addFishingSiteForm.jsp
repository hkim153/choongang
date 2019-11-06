<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		width: 100%;
	}	
	
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

<h2>낚시터</h2>
	<table>
		<tr>
			<td><a href="hs_addForm.do">낚시터 추가하기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>번호</th><th>낚시터 이름</th><th>작성자</th><th>지역</th><th>주소</th><th>추가일</th><th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="fs" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td class="left" width=200>
					        <c:if test="${fs.readcount > 20}">
						         	<img src='images/hot.gif'>
						   </c:if>
						 <a href='hs_content.do?num=${fs.fs_num}&pageNum=${currentPage}'>
							${fs.fs_name}</a>
					</td>
					<td>${fs.id}</td>
					<td>${fs.fs_reg}</td>
					<td>${fs.fs_addr}</td>
					<td>${fs.reg_date }</td>
					<td>${fs.readcount }</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='hs_addFishingSiteForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='hs_addFishingSiteForm.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='hs_addFishingSiteForm.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>