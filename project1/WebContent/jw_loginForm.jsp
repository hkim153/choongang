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
		<!-- <div class="logo">
				<form action="search.jsp" name="search" method="get">
					<input type="text" name="searchBox" title="searchBox"
						placeholder="검색어를입력해주세요!">
				</form>
			</div> -->
		<div class="logo">
			<a	href="main.do"><img src="images/LOGO.png" width="100%" height="100%"></a>
		</div>
		</header>

		<!-- <div style="position:relative;width:1080px;margin:0 auto;z-index:11"> -->
		<div
			style="position: relative; width: 1080px; margin: 0 auto; z-index: 11">
			<div id="da_top"></div>
			<div id="da_brand"></div>
			<div id="da_stake"></div>
			<div id="da_expwide"></div>
		</div>
		<!-- 스타일 절대건드리지마! -->

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
			<tr>
				<td><input type="button" value="아이디찾기"
					onclick="location.href='ws_idfind.jsp'"></td>
			</tr>
			<tr>
				<td><input type="button" value="비밀번호찾기"
					onclick="location.href='ws_pwfind.jsp'"></td>
			</tr>

		</table>
	</form>
	</div>
	
</body>
</html>