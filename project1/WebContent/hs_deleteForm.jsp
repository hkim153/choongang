<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2>삭제하려면 암호를 입력하세요</h2>
			<form action="hs_deletePro.do">
				<input type="hidden" name="pageNum" value="${pageNum }"> <input
					type="hidden" name="num" value="${num }"> <input
					type="hidden" name="id" value="${fs.id }"> <input
					type="hidden" name="curid" value="${sessionScope.id }"> <input
					type="hidden" name="rightpasswd" value="${sessionScope.passwd}">
				<table>
					<tr>
						<td>작성자</td>
						<td>${fs.id }</td>
					</tr>
					<tr>
						<td>암호</td>
						<td><input type="password" name="passwd"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input type="submit" value="확인"> <input
							type="reset" value="다시 쓰기"></td>
					</tr>

				</table>

			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>