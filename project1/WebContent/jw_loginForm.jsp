<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="./css/product.css" rel="stylesheet" type="text/css">
<style type="text/css">
#container .login_form {
	padding: 0;
	margin: 8em auto 25px;
	width: 1080px;
	position: relative;
	height: 330px;
	text-align: center;
}

#container .login_form .form {
	padding: 0;
	margin: 1em auto 25px;
	width: 370px;
	position: relative;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}

.btnColor {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 50px;
	width: 60px;
	font-size: 15px;
}

.btnColor1 {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 29px;
	width: 80px;
	font-size: 15px;
}

.btnColor2 {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 29px;
	width: 88px;
	font-size: 15px;
}

.btnColor3 {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 29px;
	width: 102px;
	font-size: 15px;
}
</style>
<script type="text/javascript">
	function idchk() {
		if (!frm.id.value) {
			alert("id를 입력안하셨습니땅!");
			frm.id.focus();
			return false;
		}
		return true;
	}
	function passwdchk() {
		if (!frm.passwd.value) {
			alert("암호를 입력안하셨습니땅!");
			frm.passwd.value();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="wrap">
		<header><jsp:include page="header.jsp"></jsp:include></header>
		
		<div id="container">
			<div class="login_form">
				<form action="jw_loginPro.do" method="post" name="frm">
					<h2>로그인 화면</h2>
					<div class="form">

						<table>
							<tr>
								<td>아 이 디 : <input type="text" name="id" required="required" onsubmit="return idchk()" style="margin-left: 5px; width: 190px;"></td>
								<td rowspan="2"><input type="submit" value="로그인" class="btnColor"></td>
							</tr>

							<tr>
								<td>비밀번호: <input type="password" name="passwd" 	onsubmit="return passwdchk()" required="required" style="margin-left: 5px; width: 191px;"></td>
							</tr>

							<tr>
								<td><input type="button" value="회원가입"	onclick="location.href='jw_joinForm.do'" class="btnColor1">
									<input type="button" value="아이디찾기"	onclick="location.href='ws_idfind.jsp'" class="btnColor2">
									<input type="button" value="비밀번호찾기" onclick="location.href='ws_pwfind.jsp'" class="btnColor3">
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>