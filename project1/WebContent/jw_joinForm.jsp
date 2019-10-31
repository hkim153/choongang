<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 일치하지 않습니다!");
			frm.passwd.focus();
			return false;
		}
		return true;
	}
	function winop() {
		/* if (!frm.id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		} */
		window.open("jw_confirmIdPro.do?id=${id}" + frm.id.value, "",
				"width=300 height=300");
	}
</script>
</head>
<body>
<div class="wrap">
		<header>
		<div class="gnb">
			<ul>
				<li><a href="board.do">게시판</a></li>
				<li><a href="store.do">판매 및 대여</a></li>
				<li><a href="recruit.do">팀원모집</a></li>
				<li><a href="fishing.do">낚시터</a></li>
				<li><a href="event.do">이벤트 달력</a></li>
				<li><a href="fishingking.do">이달의 낚시왕</a></li>
			</ul>
		</div>
		<div class="logo">
			<img src="images/LOGO.png" width="100%" height="100%"> <a
				href="main.do"></a>
		</div>
		</header>
		
	<div class="container" role="main">	
	<form action="jw_joinPro.do" method="post" name="frm"		onsubmit="return chk()">
		<table border="1">
			<caption>
				<h2>회원가입</h2>
			</caption>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required"></td>
				<td><input type="submit" value="중복확인" onclick="winop()" required="required"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td><input type="password" name="passwd2" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><input type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" required="required"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="tel" required="required"
					patten="\d{2,3}-\d{3-4}-\d{4}" placeholder="xxx-xxxx-xxxx"
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