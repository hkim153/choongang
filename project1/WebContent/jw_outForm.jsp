<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="test.css" rel="stylesheet" type="text/css">
<style type="text/css">
.wrap {
	position: relative;
	overflow: hidden;
	min-width: 1100px;
	background: #fff;
}

.container {
	width: 1080px;
	margin: 0 auto;
	padding: 8px 10px 0;
	zoom: 1;
	height: 480px;
}
.btnColor {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 29px;
	width: 80px;
	font-size: 15px;
	margin-top: 5px;
	}
</style>
<link href="join.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<div class="container">
			<form action="jw_outPro.do" method="post">
				<input type="hidden" name="id" value="${sessionScope.id }">
				<h3>탈퇴하시겠습니까?</h3>
				<span class="ps_box int_id1"> 
				<input type="password" name="passwd" placeholder="비밀번호를 입력해주세요" style="width: 100%; margin-top:7px;"></span>
				<input type="submit" value="탈퇴하기" class="btnColor"> <input type="button"	value="돌아가기" onclick="location.href='main.do'" class="btnColor">
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>