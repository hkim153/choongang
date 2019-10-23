<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
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
			<img src="images/LOGO.png" width="100%" height="100%"> <a
				href="main.do"></a>
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



		<div class="container" role="main">
			<div id="promotion1" style="display: block;"
				data-cookie="PC_CENTER_BANNER_12940">
				<img src="images/f_king.png" width="1080" height="254"
					alt="V앱_BTS사우디생중계" usemap="#promotion1_map">
				<map name="promotion1_map">
					<area id="promotion1_link" shape="rect" coords="0,0,1038,50"
						href="https://www.vlive.tv/video/152683" alt="프로모션 이동"
						data-clk="neb.image">
					<area id="promotion1_close" shape="rect" coords="1038,0,1080,50"
						href="#" alt="프로모션 닫기" data-clk="neb.imagecls">
				</map>
			</div>
			<!-- bts광고판 이달의 낚시왕 -->

			<div class="column_left">
				<div id="veta_top">
					<img alt="" src="images/main_product.png" width="100%" height="100%">
				</div>
				<!-- 낚시터 추천 or 낚시 물품 판매(슬라이드쇼) -->

				<div id="board" class="board_side">
					<img src="images/board.png">
				</div>
				<!--  게시판 -->
			</div>
			<!-- 왼쪽칼럼 끝  -->

			<div class="column_right">

				<div id="account" class="section_login">
					<form action="login.jsp"></form>
					<img alt="" src="images/login.png">
				</div>

				<!-- 로그인  -->
				<!-- 			<div class="event_side"> -->
				<div class="section_login">

					<img alt="" src="images/event_C.png">
 
				</div>
				<!-- 이벤트달력 작게  -->

				<!-- <div class="recruit_side" > -->
				<div class="section_login">

					<img alt="" src="images/recruit.png">

				</div>
				<!-- 인원모집  -->
			</div>
			<!-- 오른쪽 칼럼 끝 -->

		</div>
	</div>


</body>
</html>