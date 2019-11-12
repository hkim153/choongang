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
							<th>순위</td>
							<th id="sj_p">아이디</td>
							<th id="sj_o">길이</td>
							<th>등록일</td>
							<th style="display: none;">삭제버튼 (안보이게할거)</th>
						</tr>
						<c:forEach var="rank" items="${list1 }">
							<c:if test="${rank.get_fish =='광어'}">
								<c:if test="${startNum < 4 }">
									<tr>
										<th>${startNum }등</td>
										<td id="sj_p"><a
											href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}'>${rank.id }/${rank.get_fish }</a></td>
										<td id="sj_o">${rank.length }cm</td>
										<td>${rank.reg_date }</td>
										<c:choose>
								<c:when test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
									<!-- 로그인값, 어드민권한 둘다 있을때  -->
									<td><input type="button" value="삭제"
										onclick="location.href='sj_deleteform.do?num=${rank.num}&id=${rank.id }'"></td>
								</c:when>
							</c:choose>
									</tr>
									<c:set var="startNum" value="${startNum + 1 }"></c:set>
								</c:if>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div id="sj_e">
				현재 광어 랭킹 1위의 사진입니다.
				<table>
						<tr>
							<td style="display:none;">순위${startNum1 }</td>
						</tr> 
					<c:forEach var="rank1" items="${list2 }">
						<c:if test="${rank1.get_fish =='광어'}">
							<c:if test="${startNum1 <2 }">
								 <tr>
									<td><img src="${pageContext.request.contextPath}/${rank1.img_folder }/${rank1.real_name }" height="250px"></td>									
								</tr> 
								<c:set var="startNum1" value="${startNum1 +1 }"></c:set>	
							</c:if>
						</c:if>
					</c:forEach>
				</table> 
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
							<c:when test="${sessionScope.result ne 1 }">		<!-- 로그인값이없을때 -->
								
									<a href="jw_loginForm.do"><input type="button" value="로그인하기" > </a>
									<!-- <img alt=""	src="images/login.png" width="330" height="100"> -->
								
							</c:when>
							<c:when
								test="${sessionScope.result eq 1 and( sessionScope.adminResult ne 1)}">		<!-- 로그인값이있고 어드민 권한이없을때  -->
								<p>${sessionScope.id }님환영합니다!</p>
								<a href="jw_myPage.do"> <input type="button" value="마이페이지">
								</a>
								<a href="wh_Pro_registForm.do"><input type="button"
									value="상품등록"> </a>
								<a href="jw_logOut.do"> <input type="button" value="로그아웃">
								</a>
							</c:when>
							<c:when
								test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">		<!-- 로그인값, 어드민권한 둘다 있을때  -->
								<p>Admin입니다.</p>
									<p align="right"><a href="hh_index.jsp">달력 게시판 이동</a></p>
								<a href="jw_logOut.do"> <input type="button" value="로그아웃"></a>
							</c:when>
						</c:choose>
					</div>

				<!-- 로그인  -->
				<!-- 			<div class="event_side"> -->

				<div class="calendar">
						   
					<iframe src="hh_macalender.jsp" width="100%" height="330px"></iframe>	
 					<input type="button" value="달력 이동" onclick="location.href='hh_calender.jsp'" >    
				</div> 

				<!-- 이벤트달력 작게  -->

				<!-- <div class="recruit_side" > -->
				<div class="recruit">
					<div class="recruit_recruit" style="width:150px;">
						<a href="dh_recruit.do">
							<img alt="" src="images/Recruit.png">
						</a>
					</div>
					<div class="recruit_list" style="width:150px;">
						<a href="dh_recruitlist.do">
							<img alt="" src="images/Recruit_list.png">
						</a>
					</div>
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
