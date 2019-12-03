<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="join.css" rel="stylesheet" type="text/css">
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
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<div class="container" role="main">
			<form action="ws_idfindPro.do" method="post" name="frm"
				onsubmit="return chk()">
				<input type="hidden" id="idChkVal" name="idChkVal" value="0">
				<div id="container1" role="main">
					<div id="content">
						<div class="join_content">
							<div class="row_group">
								<div class="join_row">
									<h1>아아디 찾기</h1>
									<h3 class="join_title">
										<label for="id"> E-Mail </label>
									</h3>
									<span class="ps_box int_id"> <input type="text"	name="email" required="required" class="int">
									</span>
									<h3 class="join_title">
										<label for="id"> 전화번호 </label>
									</h3>
									<span class="ps_box int_id"> <input type="tel"
										name="tel" required="required" class="int" 	patten="\d{2,3}-\d{3-4}-\d{4}" placeholder="xxx-xxxx-xxxx"
										title="2,3자리-3,4자리-4자리" style="font-size:">
									</span> <input type="submit" value="확인" class="btnColor"> <input type="reset" value="취소" onclick="location.href='main.do'" class="btnColor">
								</div>
							</div>
						</div>
					</div>
			</form>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>