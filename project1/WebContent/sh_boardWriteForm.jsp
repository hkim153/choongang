<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
/* 게시판 글쓰기 */
#board_write {
	width: 900px;
	position: relative;
	margin: 0 auto;
}

#write_area {
	margin-top: 70px;
	font-size: 14px;
}

#in_name {
	margin-top: 30px;
}

#in_name textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

#in_title {
	margin-top: 30px;
}

#in_title textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

.wi_line {
	border: solid 1px lightgray;
	margin-top: 10px;
}

#in_content {
	margin-top: 10px;
}

#in_content textarea {
	font: 14px;
	color: #333;
	width: 900px;
	height: 400px;
	resize: none;
}

#in_pw input {
	font: 14px;
	margin-top: 10px;
}

.bt_se {
	margin-top: 20px;
	text-align: center;
}

.bt_se button {
	width: 100px;
	height: 30px;
}
</style>


</head>
<body>
	<header> <jsp:include page="header.jsp"></jsp:include> </header>

	<form action="sh_boardWritePro.do?pageNum=${pageNum}" method="post">
		<input type="hidden" name="b_id" value="${sessionScope.id }">

		<div id="board_write">
			<h1>게시판</h1>
			<div id="write-area">

				<input type="text" name="b_head" list="choices"
					placeholder="말머리를 선택하세요" required="required">
				<datalist id="choices">
					<c:if test ="${sessionScope.adminResult eq 1 }">
						<option value="공지"></option>
					</c:if>
						<option value="자유"></option>
						<option value="팁"></option>
				</datalist>


				<div id="in_title">
					<textarea name="b_title" id="utitle" rows="1" cols="55"
						placeholder="제목" maxlength="100" required></textarea>
				</div>
				<div class="wi_line"></div>

				<div id="in_name">${sessionScope.id}</div>

				<div class="wi_line"></div>
				<div id="in_content">
					<textarea name="b_content" id="ucontent" placeholder="내용" required></textarea>
				</div>

				<div class="bt_se">
					<button type="submit">등록</button>
					<button type="reset">다시작성</button>
					<button type="button"
						onclick="location.href='sh_board.do?pageNum=${pageNum}'">취소</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>