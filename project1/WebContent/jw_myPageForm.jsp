<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="test1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<div class="container" role="main">
			<form action="jw_myPage.do" method="post">
				<table border="1">
					<caption>
						<h2>회원정보수정</h2>
					</caption>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" required="required" value=""></td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="text" name="email" required="required" value=""></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" required="required" value=""></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" name="tel" required="required" value=""patten="\d{2,3}-\d{3-4}-\d{4}" placeholder="xxx-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
					</tr>
					<tr>
				<td><input type="submit" value="확인" >
				<input type="reset" value="취소" onclick="location.href='main.do'"></td>
			</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>