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
<style type="text/css">
	.sj_c td {
		border-top: 1px groove;
		border-bottom: 1px solid;
		border-collapse : collapse;
	}
	.sj_c {
		float: left;
		margin-left: 40px;
	}
	#sj_i{
		text-align: center;
		width:150px;
	}
	#sj_l{
		text-align: center;
		width:100px;
		height:50px;
	}
	#sj_e{
		float: right;
		margin-right: 150px;
		width:400px;
		height:200px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>



		<div class="container" role="main">
			<div id="promotion1" style="display: block;"
				data-cookie="PC_CENTER_BANNER_12940">
				<div class="sj_c">
					<table>
						<h3>광어의 현재 상위 랭킹</h3>
						<tr>
							<td>순위</td>
							<td id="sj_i">아이디</td>
							<td id="sj_l">길이</td>
							<td>등록일</td>
						</tr>
						<c:forEach var="rank" items="${list1 }">
							<c:if test="${rank.get_fish =='광어'}">
								<c:if test="${startNum < 4 }">
									<tr>
										<td>${startNum }등</td>
										<td id="sj_i"><a
											href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}'>${rank.id }/${rank.get_fish }</a></td>
										<td id="sj_l">${rank.length }cm</td>
										<td>${rank.reg_date }</td>
									</tr>
									<c:set var="startNum" value="${startNum + 1 }"></c:set>
								</c:if>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div id="sj_e">
				광어 랭킹 1위의 물고기 사진(구현예정)
				<img src="${pageContext.request.contextPath}/fish_rank/kwangA1.jpg">
				</div>
				<!-- 이달의 낚시왕 -->

				<div class="column_left">
					<div id="veta_top">
						<div class="pro_best">
							<div class="content">
								<div>
									<h3 class="best_tit">야낚자 추천 베스트</h3>
									<div class="pro_list">
										<ul class="pro_wrap">
											<c:forEach var="poplist" items="${pop_list}">
												<li style="margin-right: opx;">
													<div>
														<div class="pro_img">
															<img
																src="${pageContext.request.contextPath}/${poplist.img_folder}/${poplist.real_name}"
																alt="상품대표이미지" />
														</div>
														<div class="pro_info">
															<span class="pro_name"> ${poplist.pro_name} </span> <span
																class="price"> ${poplist.price } 원</span>
															<%-- <span class="sellcnt"> ${poplist.sellcnt }</span> --%>
															<span class="stock"> <i>재고</i> <strong>${poplist.stock }
																	개</strong>
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
							<c:when test="${sessionScope.result ne 1 }"> <!-- 로그인값이없을때 -->
								<form action="login.do">
									<a href="jw_loginForm.do"> <img alt=""src="images/login.png" width="200" height="100"></a>
								</form>
							</c:when>
							<c:when test="${sessionScope.result eq 1 and( sessionScope.adminResult ne 1)}"> <!-- 로그인값이있고 어드민 권한이없을때  -->
								<p>${sessionScope.id }님환영합니다!</p>
								<a href="jw_myPage.do"> <input type="button" value="마이페이지">
								</a>
								<a href="wh_Pro_registForm.do"><input type="button"
									value="상품등록"> </a>
								<a href="jw_logOut.do"> <input type="button" value="로그아웃">
								</a>
							</c:when>
							<c:when test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }"> <!-- 로그인값, 어드민권한 둘다 있을때  -->
							<p> Admin입니다.</p>
							<a href="jw_logOut.do"> <input type="button" value="로그아웃"></a>
							</c:when>
						</c:choose>
					</div>

					<!-- 로그인  -->
					<!-- 			<div class="event_side"> --> 
					<div class="calendar	">

						<iframe src="index2.html" width="100%" height="350px"></iframe>

					</div>
					<!-- 이벤트달력 작게  --> 

					<!-- <div class="recruit_side" > -->
					<div class="recruit">

						<a href="DH_channel.jsp"><img alt="" src="images/login.png"
							width="200" height="100"></a></a>

					</div>
					<!-- 인원모집  -->
				</div>
				<!-- 오른쪽 칼럼 끝 -->
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>
