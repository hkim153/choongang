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
<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap"
	rel="stylesheet">
<link href="test.css" rel="stylesheet" type="text/css">
<style>


* {
	margin: 0 auto;
	padding: 0;
	font-family: 'Malgun gothic', 'Sans-Serif', 'Arial';
}

a {
	text-decoration: none;
	color: #333;
}

ul li {
	list-style: none;
}

/*공통*/
.fl {
	float: left;
}

.tc {
	text-align: center;
}

/*게시판 목록*/
#board_area h1{
	font-size: 50px;
	font-family: 'Dokdo', cursive;
	font-weight: bold;
	margin-left: 30px;
	
}
#board_area {
	width: 1100px;
	position: relative;
	margin-top: 20px;
}

.list-table {
	margin-top: 40px;
}

.list-table thead th {
	height: 40px;
	border-top: 2px solid #09C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 17px;
}

.list-table tbody td {
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px
}

#write_btn {
	position: relative;
	top: 30px;
	left: 970px;
}
#write_btn .bt{
	color: white;
	font-size: 15px;
	background-color: #3db6cc;
	border: 0;
	height: 30px;
	width: 120px;
}
</style>
</head>
<!-- 게시판 가져오기  -->
<body>
	<!--헤더 가져오기  -->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<!-- "hsd": 디자인 영역 -->
	<div id="board_area">
		<h1>낚시터</h1>
		<div id="write_btn">
		
			<!-- 열(column)이 7개 있어서 한줄로 표현하기 위함  -->
			<a href="hs_addForm.do"><input class="bt"
							type="button" value="낚시터 추가하기"></a>
	
		</div>	
		<!-- 테이블 시작 -->
		<table class="list-table">
			<thead>
			
			<!-- 테이블 목록만 글씨 11pt 두껍게 -->
			<tr style="font: 11pt bold;">
				<th width="70">번호</th>
				<th width = "120">낚시터 이름</th>
				<th width = "100">작성자</th>
				<th width = "100">지역</th>
				<th width = "400">주소</th>
				<th width = "100">추가일</th>
				<th width = "100">조회수</th>
			</tr>
			<tbody>
			<!-- totCnt 는 DB에 있는 게시글 갯수, by getTotalCnt() in fishingsiteDao -->
			<c:if test="${totCnt > 0 }">
				<!-- loop 시작: 각 게시글의 정보들을 가져온다  -->
				<c:forEach var="fs" items="${list }">
					<tr>
						<!-- startNum: 현재 페이지 게시글 번호, 큰번호에서부터 시작  -->
						<!-- int startRow = (페이지 갯수 - 1)*한페이지당 게시글 갯수 + 1;
							 int startNum = totCnt - startRow + 1 -->
						<td>${startNum }</td>
						
						<td class="left" width=200>
							<!-- 조회수가 20이상일때 인기글 그림 표시 -->
							<c:if test="${fs.readcount > 20}">
								<img src='images/hot.gif'>
							</c:if> 
							<!-- 낚시터 이름 클릭시 낚시터 번호와 현재 페이지 정보 넘김, 게시글 보기  -->
							<a href='hs_content.do?num=${fs.fs_num}&pageNum=${currentPage}'>
								${fs.fs_name}</a>
						</td>
						<!-- 작성자 -->
						<td>${fs.id}</td>
						<!-- 낚시터 지역  -->
						<td>${fs.fs_reg}</td>
						<!-- 낚시터 주소 -->
						<td>${fs.fs_addr}</td>
						<!-- 작성일 db sysdate랑 같음 -->
						<td>${fs.reg_date }</td>
						<!-- 조회수 -->
						<td>${fs.readcount }</td>
					</tr>
					<!-- startNum: 현재 페이지 게시글 번호, 1씩 줄이면서 위에서 밑으로 게시글 써진다! -->
					<c:set var="startNum" value="${startNum - 1 }" />
				<!-- loop 종료 -->
				</c:forEach>
			</c:if>
			</tbody>
			<!-- totCnt 는 DB에 있는 게시글 갯수, 없을 경우 데이터가 없다고 표시  -->
			<c:if test="${totCnt == 0 }">
				<tr>
					<td colspan=7>데이터가 없네</td>
				</tr>
			</c:if>
		</table>

		<!-- 페이지 번호  -->
		
		<div style="text-align: center; margin-bottom:20px;">
			<!-- blockSize보다 현재 위치한 페이지가 크면 [이전] 표시 -->
			<c:if test="${startPage > blockSize }">
				<a href='hs_addFishingSiteForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
			</c:if>
			<!-- 페이지 표시 및 이동 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test = "${i == currentPage }">
					<a style = "color:red;" href='hs_addFishingSiteForm.do?pageNum=${i}'>[${i}]</a>
				</c:if>
				<c:if test = "${i != currentPage }">
					<a href='hs_addFishingSiteForm.do?pageNum=${i}'>[${i}]</a>
				</c:if>
			</c:forEach>
			<!-- blockSize가 현재 위치한 페이지보다 크면 [다음] 표시 -->
			<c:if test="${endPage < pageCnt }">
				<a href='hs_addFishingSiteForm.do?pageNum=${startPage+blockSize}'>[다음]</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>