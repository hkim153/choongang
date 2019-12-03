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
#hsd1 {
	margin: 60px;
}

#hsb1, #hsb2 {
	border-width: 10px;
	border-style: double;
	border-color: #99e7ff;
	margin: 20px;
	width: 300px;
	height: 300px;
	display: inline-block;
	background-color: #3db7cc;
	border-radius: 50px;
	box-shadow: 10px 10px 15px 5px black;
}

#hsf1, #hsf2 {
	font: 60px Dokdo, cursive;
	margin-top: 125px;
}
</style>
</head>
<body>

	<div class="wrap">
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div
			style="width: 1080px; height: 500px; text-align: center; margin: 0 auto; padding: 8px 10px 0; zoom: 1;">
			<div id="hsd1">
				<div id="hsb1">
					<div id="hsf1">
						<a href="hs_addFishingSiteForm.do">낚시터 게시판</a>
						<p>
					</div>
				</div>
				<div id="hsb2">
					<div id="hsf2">
						<a href="hs_userPreferForm.do">추천 낚시터 </a>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>