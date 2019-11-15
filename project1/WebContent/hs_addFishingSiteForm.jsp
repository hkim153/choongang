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
<link href="test.css" rel="stylesheet" type="text/css">
<style>
table {
	width: 80%;
}

#hsd {
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	font-size: 9pt;
	
}

table {
	
	background-color: #99e7ff;
	width:1080px;
	text-align: center;
	 margin: 0 auto;
	  padding: 8px 10px 0;
	   zoom: 1;
}

tr:hover {
	background-color: ornage;
}

td {
	background-color: #e8ffff;
	text-align: center;
	padding: 10px;
}

</style>
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<div id="hsd">
			<h2>낚시터</h2>
			<table>
				<tr>
					<td><a href="hs_addForm.do">낚시터 추가하기</a></td>
				</tr>
			</table>
			<table>
				<tr style="font: black bold;">
					<th>번호</th>
					<th>낚시터 이름</th>
					<th>작성자</th>
					<th>지역</th>
					<th>주소</th>
					<th>추가일</th>
					<th>조회수</th>
				</tr>
				<c:if test="${totCnt > 0 }">
					<c:forEach var="fs" items="${list }">
						<tr>
							<td>${startNum }</td>
							<td class="left" width=200><c:if test="${fs.readcount > 20}">
									<img src='images/hot.gif'>
								</c:if> <a href='hs_content.do?num=${fs.fs_num}&pageNum=${currentPage}'>
									${fs.fs_name}</a></td>
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
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>