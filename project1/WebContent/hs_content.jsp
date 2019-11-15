<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-color: black;
}

table {
	background-color: #99e7ff;
	width: 1080px;
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
			<table border="1">
				<caption>
					<h2>${fs.fs_name}</h2>
				</caption>
				<tr>
					<td width="50">번호</td>
					<td>${fs.fs_num}</td>
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
					<td><c:forEach var="fish" items="${fishes }">
				${fish } 
			</c:forEach></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><img
						src="${pageContext.request.contextPath}/${fs.img_folder }/${fs.real_name}"
						alt="낚시터 이미지" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>${fs.fs_content}</pre></td>
				</tr>
				<tr>
					<td colspan="2"><c:if test="${fs.id == sessionScope.id }">
							<input type="button" value="수정"
								onclick="location.href='hs_updateForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
							<input type="button" value="삭제"
								onclick="location.href='hs_deleteForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
						</c:if> <input type="button" value="목록"
						onclick="location.href='hs_addFishingSiteForm.do?pageNum=${pageNum}'"></td>
				</tr>
			</table>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>

</body>
</html>