<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css?" rel="stylesheet" type="text/css">
<link href="./css/product.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Dokdo&display=swap"	rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <style type="text/css">
.btnColor {
	border: 0;
	color: white;
	background-color: #3DB7CC;
	background-position: - -47px;
	height: 29px;
	width: 70px;
	margin-right: 5px;
	font-size: 15px;
}
</style>  -->
<style type="text/css">
.board_table tr td.left{
	text-align: left;
}

.board_table tr td.left:hover{
	color:red;	
}
</style>

</head>
<body>
<!-- 승주 랭킹 시작  -->
	<div class="wrap">
		<header> <jsp:include page="header.jsp"></jsp:include> </header>
		<div class="container" role="main">
			<div id="promotion1" style="display: block;"
				data-cookie="PC_CENTER_BANNER_12940">

				<div class="column_left">
					<div>
						<img src="images/yanakja_rank3_2.png" />
						<hr>
					</div>
					<div class="sj_c">
						<div class="rank_title">
							<span>현재 TOP 3 - 광어</span>
						</div>
						<div class="rank_table">
							<table>

								<tr>
									<th style="width: 40px;">순위</th>
									<th id="sj_p">아이디</th>
									<th style="width: 40px;">어종</th>
									<th id="sj_o">길이</th>
									<th id="sj_h">등록일</th>
									<th style="display: none;">삭제버튼 (안보이게할거)</th>
								</tr>	<!-- list1가 비어있는 경우 -->
										<!-- list1가 비어있지 않은 경우 물고기가 광어이면서 3등까지 리스트 보여주기-->
								<c:choose>
								<c:when test="${empty list1 }">
								<tr>
								<td style="text-align:center" colspan="5">현재 등록된 랭킹이 존재하지 않습니다</td>
								</tr>
								</c:when>
								
								<c:when test="${not empty list1 }">
								<c:forEach var="rank" items="${list1 }">
									
									<input type="hidden" id="img_folder" name="img_folder"
										value="${rank.img_folder }" />
									<input type="hidden" id="real_name" name="real_name"
										value="${rank.real_name }" />
										
									 <c:choose>
										<c:when test="${startNum < 4 }">
											<tr>
												<th>${startNum }등</th>
												<td id="sj_p" class="thumbnail">
													 
												<a href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}'>${rank.id }</a>
												</td>
												<td class="thumbnail">
												<a href='sj_content.do?num=${rank.num }&id=${rank.id }&img_folder=${rank.img_folder}'>${rank.get_fish }</a></td>
												<td id="sj_o">${rank.length }cm</td>
												<td id="sj_h" colspan="2">${rank.reg_date }</td>
												<c:choose>
													<c:when
														test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
														
														<td><input type="button" value="삭제" id="loginBtn1" 
															onclick="location.href='sj_deleteform.do?num=${rank.num}&id=${rank.id }'">
														</td>
													</c:when>
												</c:choose>
											</tr>
											<c:set var="startNum" value="${startNum + 1 }"></c:set>
										 </c:when>
									</c:choose> 
								</c:forEach>
								</c:when>
								</c:choose>
								<!-- 로그인값, 어드민권한 둘다 있을때  -->
							</table>
						</div>
							<!-- 사진은 1등의 사진만 보여주기 -->
						<div class="rank_top1">
							<c:forEach var="rank1" items="${list2 }">
								<c:if test="${rank1.get_fish =='광어'}">
									<c:if test="${startNum1 <2 }">
										<tr>
											<td><img
												src="${pageContext.request.contextPath}/${rank1.img_folder }/${rank1.real_name }">
											</td>
										</tr>
										<c:set var="startNum1" value="${startNum1 +1 }"></c:set>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<div class="rank_info">
							<div>
								<span>* 위 이미지는 <strong>랭킹 TOP</strong> 1 물고기 이미지 입니다.
								</span>
							</div>
						</div>
					</div>
<!-- 승주 랭킹 끝  -->
					<hr>
					<div id="veta_top">
						<div class="pro_best">
							<div class="content">
								<div>
									<div class="pro_title">
										<span>야낚자 추천 베스트</span>
									</div>
									<div class="pro_list">
										<ul class="pro_wrap">
											<c:set var="poplistcnt" value="0"/>
											<c:forEach var="poplist" items="${pop_list}">
												<c:set var="poplistcnt" value="${poplistcnt+1}"/>
												<li style="margin-right: opx;">
													<div>
														<div class="pro_img">
															<a
																href="wh_ProContent.do?pro_num=${poplist.pro_num }&pro_code=${poplist.pro_code}">
																<img
																src="${pageContext.request.contextPath}/${poplist.img_folder}/${poplist.real_name}"
																alt="상품대표이미지" />
															</a>
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
											<c:if test="${poplistcnt == 0 }">
												등록된 상품이 없습니다.									
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 낚시터 추천 or 낚시 물품 판매(슬라이드쇼) -->

				</div>
				<!-- 왼쪽칼럼 끝  -->

				<div class="column_right">

					<div id="account" class="section_login">
					<div  class="login_view">
						<c:choose>
							<c:when test="${sessionScope.result ne 1 }">
								<!-- 로그인값이없을때 -->

								<a href="jw_loginForm.do"><input type="button" value="로그인하기"
									id="loginBtn"> </a>
								

							</c:when>
							
							<c:when
								test="${sessionScope.result eq 1 and( sessionScope.adminResult ne 1)}">
								<!-- 로그인값이있고 어드민 권한이없을때  -->
								<p>${sessionScope.id }님환영합니다!</p>
								<a href="hh_index.jsp"><input type="button" value="일정등록" id="btnColor"> </a>
								<a href="jw_myPage.do"> <input type="button" value="MyPage" id="btnColor"> </a>
								<a href="jw_logOut.do"> <input type="button" value="LogOut" id="btnColor"> </a>
							</c:when>
							<c:when
								test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
								<!-- 로그인값, 어드민권한 둘다 있을때  -->
								<p>Admin입니다.</p>
				
								<a href="hh_index.jsp"><input type="button" value="일정등록" id="btnColor"> </a>
								<a href="wh_Pro_registForm.do"><input type="button"	value="상품등록" id="btnColor"> </a>
								<a href="jw_logOut.do"> <input type="button" value="LogOut" id="btnColor"></a>
							</c:when>
							
						</c:choose>
						</div>
					</div>

					<!-- 로그인  -->
					<!-- 			<div class="event_side"> -->

					<div class="calendar">

						<iframe src="hh_macalender.jsp"
							style="width: 100%; height: 315px;"></iframe>
						<!-- <input type="button" value="달력 이동" onclick="location.href='hh_calender.jsp'" >   현호야 버튼 일단 주석처리 해둘게  -->
					</div>

					<!-- 이벤트달력 작게  -->

					<!-- <div class="recruit_side" > -->
					<div class="recruit">
						<div class="recruit_title">
							<span>야낚자로 모여라 !</span>
						</div>
						<hr>
						<div class="recruit_recruit"
							style="width: 166px; float: left; margin-right: 0; margin-top: 15px;">
							<a href="dh_recruit.do"> <img alt="" src="images/Recruit.png">
							</a>
						</div>
						<div class="recruit_list" style="width: 166px; float: left; margin-top: 15px;">
							<a href="dh_recruitList.do"> <img alt=""
								src="images/Recruit_list.png">
							</a>
						</div>
					</div>
					<!-- 인원모집  -->
				</div>
				<!-- 오른쪽 칼럼 끝 -->
			</div>
			<div id="board" class="board_side">
				<div class="board_title">
					<span>게시판</span>
				</div>
				<hr>
				<div class="board_table" style="text-align: center; margin:10px auto;">
					<table>
						<tr>
							<th style="width:100px;">번호</th>
							<th style="width:100px;">말머리</th>
							<th style="width:200px;">제목</th>							
							<th style="width:100px;">작성자</th>
							<th style="width:120px;">등록일</th>
							<th style="width:100px;">조회수</th>
						</tr>
						<c:set var="startNum" value="1" />
						<c:forEach var="board" items="${mainlist }">
							<tr>
								<td>${startNum }</td>
								<td><c:if test="${board.b_head==2}">[자유]</c:if> <c:if
										test="${board.b_head==3}">[팁]</c:if></td>
								<td class="left" onclick="location.href='sh_content.do?b_num=${board.b_num}&pageNum=1 &status=0'"><a>${board.b_title}</a></td>
								
								<td>${board.b_id}</td>
								<td>${board.b_date}</td>
								<td>${board.b_readcount}</td>
							</tr>
							</tbody>
							<c:set var="startNum" value="${startNum + 1 }" />
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>