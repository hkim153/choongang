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
	<div id="wrap1">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<div id="container" style="height: 968px;">
			<div id="content" class="section_home">
				<div class="column">
					<div class="sh_group">
						<div class="sh_header">
							<h2>여기는 프로필</h2>
						</div>
						<div class="sh_content">
							<dl class="sh_list">
								<dt class="nic_tit">이름</dt>
								<dd class="nic_desc">${name}</dd>
								<br>
								<dt class="nic_tit">E-Mail</dt>
								<dd class="nic_desc">${email }</dd>
								<br>
								<dt class="nic_tit">주소</dt>
								<dd class="nic_desc">${address }</dd>
								<br>
								<dt class="nic_tit">전화번호</dt>
								<dd class="nic_desc">+82 ${tel }</dd>
							</dl>
						</div>
						<p class="btn_area_btm">
							<input type="button" onclick="location.href='ws_myPageModifyForm.do'"
								value="수정하기" class="btn_model">
						</p>
					</div>
					<div class="sh_group">
						<div class="sh_header">
							<h2>작성한 게시글 및 댓글</h2>
						</div>
						<div class="sh_content">
							<dl class="sh_list">
								<dt class="nic_tit">이름</dt>
								<dd class="nic_desc">${name}</dd>
								<br>
								<dt class="nic_tit">E-Mail</dt>
								<dd class="nic_desc">${email }</dd>
								<br>
								<dt class="nic_tit">주소</dt>
								<dd class="nic_desc">${address }</dd>
								<br>
								<dt class="nic_tit">전화번호</dt>
								<dd class="nic_desc">+82 ${tel }</dd>
							</dl>
						</div>
						<p class="btn_area_btm">
							<input type="button" onclick="location.href='jw_myPageForm.do'"
								value="추가하기" class="btn_model">
						</p>
					</div>					
				</div>
				<!-- 여기서부터 오른쪽 칼럼 -->
				<div class="column">
					<div class="sh_group">
						<div class="sh_header">
							<h2>여기는 인원모집기록</h2>
						</div>
						<div class="sh_content">
							<dl class="sh_list2">
								<dt class="nic_tit">이름</dt>
								<dd class="nic_desc">${name}</dd>
								<br>
								<dt class="nic_tit">E-Mail</dt>
								<dd class="nic_desc">${email }</dd>
								<br>
								<dt class="nic_tit">주소</dt>
								<dd class="nic_desc">${address }</dd>
								<br>
								<dt class="nic_tit">전화번호</dt>
								<dd class="nic_desc">+82 ${tel }</dd>
							</dl>
						</div>
						<p class="btn_area_btm">
							<input type="button" onclick="location.href='jw_myPageForm.do'"
								value="수정하기" class="btn_model">
						</p>
					</div>
					<div class="sh_group">
						<div class="sh_header">
							<h2>여기는 물품구매내역</h2>
						</div>
						<div class="sh_content">
							<dl class="sh_list2">
								<dt class="nic_tit">이름</dt>
								<dd class="nic_desc">${name}</dd>
								<br>
								<dt class="nic_tit">E-Mail</dt>
								<dd class="nic_desc">${email }</dd>
								<br>
								<dt class="nic_tit">주소</dt>
								<dd class="nic_desc">${address }</dd>
								<br>
								<dt class="nic_tit">전화번호</dt>
								<dd class="nic_desc">+82 ${tel }</dd>
							</dl>
						</div>
						<p class="btn_area_btm">
							<input type="button" onclick="location.href='jw_myPageForm.do'"
								value="추가하기" class="btn_model">
						</p>
					</div>					
				</div>
			</div>

		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>