<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function idchk() {
		if (!frm.id.value) {
			alert("id를 입력해주세요!");
			frm.id.focus();
			return false;
		}
		return true;
	}
	function passwdchk() {	
		if (!frm.passwd.value) {
			alert("암호를 입력해주세요!");
			frm.passwd.value();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>로그인 화면</h2>
	<form action="jw_loginPro.do" method="post" name="frm">
		<table>
			<tr>
				<td>아이디: <input type="text" name="id" required="required" onsubmit="return idchk()"></td>
			</tr>
			<tr>
				<td>암호: <input type="password" name="passwd" onsubmit="return passwdchk()"			required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인하기"
					></td>
					<!-- onclick="location.href='main.do'" -->
			</tr>
			<tr>
				<td><input type="button" value="회원가입"
					onclick="location.href='jw_joinForm.do'"></td>
			</tr>

		</table>
	</form>
</body>
</html>