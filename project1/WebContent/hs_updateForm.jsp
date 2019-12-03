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

<script src="./js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//최상단 체크박스 클릭    
		$("#checkall").click(function() {
			//클릭되었으면
			if ($("#checkall").prop("checked")) {
				//input태그의 name이 어종인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=어종]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 어종인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=어종]").prop("checked", false);
			}
		})

	})
</script>

</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<div id="board_area">
			<form action="hs_updatePro.do" enctype="multipart/form-data"
				method="post">
				<input type="hidden" name="num" value="${fs.fs_num}"> 
				<input type="hidden" name="pageNum" value="${pageNum}"> 
				<!-- 작성자, 현재 로그인 아이디, 비번 hidden으로 보내기 -->
				<input type="hidden" name="id" value="${fs.id }"> 
				<input type="hidden" name="curid" value="${sessionScope.id }"> 
				<input type="hidden" name="rightpasswd" value="${sessionScope.passwd}">
				<table class="list-table">
					<thead>
					<tr >
						<th colspan = "2">낚시터 정보 수정</th>
					</tr>
					</thead>
					<tr>
						<td width = "100">번호</td>
						<td width = "700">${fs.fs_num}</td>
					</tr>
					<tr>
						<td>낚시터 이름</td>
						<td><input type="text" name="fs_name" required="required"
							value="${fs.fs_name}"></td>
					</tr>
					<tr>
						<td>지역</td>
						<td>현재 지역:${fs.fs_reg }-> <input type="text" name="fs_reg"
							list="choices" required="required"> <datalist
								id="choices">
								<option value="경기도" label="경기도"></option>
								<option value="서울특별시" label="서울특별시"></option>
								<option value="인천광역시" label="인천광역시"></option>
								<option value="강원도" label="강원도"></option>
								<option value="충청북도" label="충청북도"></option>
								<option value="충청남도" label="충청남도"></option>
								<option value="세종특별자치시" label="세종특별자치시"></option>
								<option value="대전광역시" label="대전광역시"></option>
								<option value="경상북도" label="경상북도"></option>
								<option value="경상남도" label="경상남도"></option>
								<option value="대구광역시" label="대구광역시"></option>
								<option value="울산광역시" label="울산광역시"></option>
								<option value="부산광역시" label="부산광역시"></option>
								<option value="전라북도" label="전라북도"></option>
								<option value="전라남도" label="전라남도"></option>
								<option value="광주광역시" label="광주광역시"></option>
								<option value="제주특별자치도" label="제주특별자치도"></option>
							</datalist>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><textarea rows="1" cols="50" name="fs_addr"
								required="required">${fs.fs_addr}</textarea></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="fs_phone" value="${fs.fs_phone}"></td>
					</tr>
					<tr>
						<td>서식 어종</td>
						<!-- 먼저 현재 서식하는 어종 보이고 수정할 어종 체크박스로 보내기 -->
						<td>현재 어종: <c:forEach var="sfish" items="${fishes }">
									${sfish }  
									</c:forEach> 
						<br> 
							<input type="checkbox" id="checkall">모두 체크<br>
							<c:forEach var="fish" items="${flist }">
								<input type="checkbox" name="어종" value="${fish.f_name }">${fish.f_name }
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="50" name="fs_content">${fs.fs_content}</textarea></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td><input  type="file" name="fs_img"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${fs.id }</td>
					</tr>
					<tr>
						<td>암호</td>
						<td><input type="password" name="passwd" required="required"></td>
					</tr>
					<tr>
						<td colspan="2"><input class = "bt" type="submit" value="수정완료"></td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>