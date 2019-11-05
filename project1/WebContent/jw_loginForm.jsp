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
#container .login_form{
	padding:0;
		margin :8em auto 25px;
		width:1080px;
		position:relative;
		height:330px;
		text-align: center; 
		}
#container .login_form .form{
	padding:0;
		margin :1em auto 25px;
		width:370px;
		position:relative;		
}
</style>
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
<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>

		<div id="container">
			<div class="login_form">
				<h2>로그인 화면</h2>
				<form action="jw_loginPro.do" method="post" name="frm">
					<div class="form">
						<table>
							<tr>
								<td>아이디: <input type="text" name="id" required="required" onsubmit="return idchk()"></td>
								<td rowspan="2"><input type="submit" value="로그인"></td>
							</tr>
							<tr>
								<td>암  호: <input type="password" name="passwd" onsubmit="return passwdchk()"	required="required"></td>
							</tr>
							<tr>
								<td>
									<input type="button" value="회원가입"	onclick="location.href='jw_joinForm.do'">
									<input type="button" value="아이디찾기" onclick="location.href='ws_idfind.jsp'">
									<input type="button" value="비밀번호찾기" onclick="location.href='ws_pwfind.jsp'">
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