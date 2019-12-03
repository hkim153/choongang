<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-size: 50px;
	font-family: 'Dokdo', cursive;
}

.list-table tbody td {
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px
}

.bt{
	color: white;
	font-size: 15px;
	background-color: #3db6cc;
	border: 0;
	height: 30px;
	width: 120px;
}

</style>
</head>
<body>

	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<div id="board_area">
			<table class="list-table">
				<thead>
				<tr >
					<th colspan = "2">${fs.fs_name}</th>
				</tr>
				</thead>
				
				<tr>
					<td width="100">번호</td>
					<td width = "700">${fs.fs_num}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${fs.id}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${fs.reg_date}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${fs.readcount}</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>${fs.fs_reg}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${fs.fs_addr}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${fs.fs_phone }</td>
				</tr>
				<tr>
					<td>서식 어종</td>
					<td>
						<!-- 서식어종 fishmapping table 에서 가져오기 -->
						<c:forEach var="fish" items="${fishes }">
							${fish } 
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<!-- real path에 저장된 이미지 띄우기 -->
						<img src="${pageContext.request.contextPath}/${fs.img_folder }/${fs.real_name}"
						alt="낚시터 이미지" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>${fs.fs_content}</pre></td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 게시글 작성자랑 현재 로그인 아이디가 같으면 수정 삭제 가능함  -->
						<c:if test="${fs.id == sessionScope.id }">
						<input class = "bt" type="button" value="수정"
							onclick="location.href='hs_updateForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
						<input class = "bt" type="button" value="삭제"
							onclick="location.href='hs_deleteForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
						</c:if> 
						<input class = "bt" type="button" value="목록"
						onclick="location.href='hs_addFishingSiteForm.do?pageNum=${pageNum}'">
					</td>
				</tr>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>

</body>
</html>