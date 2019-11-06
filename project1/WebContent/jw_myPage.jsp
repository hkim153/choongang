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
			<div id="content" class="section_home">
				<div class="column">
					<div class="sh_group">
						<div class="sh_header">
							<h2>여기는 프로필</h2>
						</div>
						<div class="sh_content">
						<dl class="sh_list">
						<dt class="nic_tit">이름</dt>
						<dd class="nic_desc"></dd>
						<dt class="nic_tit">E-Mail</dt>
						<dd class="nic_desc"></dd>
						<dt class="nic_tit">주소</dt>
						<dd class="nic_desc"></dd>
						<dt class="nic_tit">전화번호</dt>
						<dd class="nic_desc"></dd>
						</dl>						
					</div>
					<p class="btn_area_btm">
					<a href="jw_myPage.jsp"></a>
					</p>
				</div>
			</div>
		</div>




	</div>
</body>
</html>





/jw_myPageForm.do=service.JW_MyPageFormAction
/jw_myPage.do=service.JW_MyPageProAction