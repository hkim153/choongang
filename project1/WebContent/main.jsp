<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<link href="./css/product.css" rel="stylesheet" type="text/css">
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
			<a href="main.do"><img src="images/LOGO.png" width="100%"
				height="100%"></a>
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
				<table border="1">
				<h3>광어의 현재 랭킹</h3>
					<tr>
						<th>순위</th>
						<th>아이디(회원이랑 연동할 예정)</th>
						<th>길이</th>
						<th>등록일(삭제하고 사진 대체 예정 사진은 1등사진만?)</th>
					</tr>
					<c:forEach var="rank" items="${list1 }">
					<c:if test="${rank.get_fish =='광어'}">
					<c:if test="${startNum < 4 }">
						<tr>
							<td>${startNum }등</td>
							<td><a href='sj_content.do?num=${rank.num }&id=${rank.id }'>${rank.id }/${rank.get_fish }</a></td>
							<td>${rank.length }cm</td>
							<td>${rank.reg_date }</td>	
						</tr>
						<c:set var="startNum" value="${startNum + 1 }"></c:set>
					</c:if>
					</c:if>
					</c:forEach>
				</table>
			</div>
			<!-- bts광고판 이달의 낚시왕 -->

			<div class="column_left">
				<div id="veta_top">
					<div class="pro_best">
						<div class="content">
							<div>
								<h3 class="best_tit">야낚자 추천 베스트 </h3>
								<div class="pro_list">
									<ul class="pro_wrap">
										<c:forEach var="poplist" items="${pop_list}">
											<li style="margin-right:opx;">
												<div>
													<div class="pro_img">
														 <img src="${pageContext.request.contextPath}/${poplist.img_folder}/${poplist.real_name}" alt="상품대표이미지"/>
													</div>
													<div class="pro_info">	
														<span class="pro_name"> ${poplist.pro_name} </span>
														<span class="price"> ${poplist.price } 원</span>
														<%-- <span class="sellcnt"> ${poplist.sellcnt }</span> --%>
														<span class="stock"> 
															<i>재고</i>
															<strong>${poplist.stock } 개</strong>
														</span>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
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
					<c:choose>
						<c:when test="${sessionScope.result ne 1 }">
							<form action="login.do">
								<a href="jw_loginForm.do"> <img alt=""
									src="images/login.png" width="200" height="100"></a>
							</form>
						</c:when>
						<c:when test="${sessionScope.result eq 1 }">
							<p>${sessionScope.id }님환영합니다 !</p>
							<input type="button" value="정보수정">
							<a href="wh_Pro_registForm.do"><input type="button" value="상품등록"></a>
							<a href="jw_logOut.do"> <input type="button" value="로그아웃">
							</a>

						</c:when>
					</c:choose>
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