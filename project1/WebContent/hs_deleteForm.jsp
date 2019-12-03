<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			
			<form action="hs_deletePro.do">
				<input type="hidden" name="pageNum" value="${pageNum }"> 
				<input type="hidden" name="num" value="${num }"> 
				<!-- 게시글 작성자, 현재 로그인 아이디, 비번 넘겨서 비교하기  -->
				<input type="hidden" name="id" value="${fs.id }"> 
				<input type="hidden" name="curid" value="${sessionScope.id }"> 
				<input type="hidden" name="rightpasswd" value="${sessionScope.passwd}">
				<table class="list-table">
					<thead>
					<tr>
						<th colspan = "2">낚시터 정보 삭제</th>
					</tr>
					</thead>
					<tr>
						<td width = "100">작성자</td>
						<td width = "700">${fs.id }</td>
					</tr>
					<tr>
						<td>암호</td>
						<td><input type="password" name="passwd"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input class = "bt" type="submit" value="확인"> 
						<input  class = "bt" type="reset" value="다시 쓰기"></td>
					</tr>

				</table>

			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>