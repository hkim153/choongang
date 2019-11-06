<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div id="header">
		<div class="logo">
			<a href="main.do"><img src="images/logo.png" width="100%"
				height="100%"></a>
		</div>
		<div class="gnb">
			<ul>
				<li><a href="board.do">게시판</a></li>
				<li><a href="wh_store.do">판매 및 대여</a></li>
				<li><a href="DH_channel.jsp">팀원모집</a></li>
				<li><a href="hs_fishingSiteForm.do">낚시터</a></li>
				<li><a href="event.do">이벤트 달력</a></li>
				<li><a href="fishingking.do">이달의 낚시왕</a></li>
				<c:choose>
					<c:when test="${sessionScope.result ne 1 }"></c:when>
					<c:when
						test="${sessionScope.result eq 1 and( sessionScope.adminResult ne 1) }">
						<li><a href="jw_myPage.do">${sessionScope.id } 님 환영합니다.</a></li>
						<li><a href="jw_logOut.do">로그아웃</a></li>
					</c:when>
					<c:when
						test="${sessionScope.result eq 1 and(sessionScope.adminResult eq 1) }">
						<!-- 로그인값, 어드민권한 둘다 있을때  -->
						<li>Admin님 환영합니다</li>
						<li><a href="jw_logOut.do">로그아웃</a></li>
					</c:when>
				</c:choose>



			</ul>
		</div>
		<!-- <div class="logo">
				<form action="search.jsp" name="search" method="get">
					<input type="text" name="searchBox" title="searchBox"
						placeholder="검색어를입력해주세요!">
				</form>
			</div> -->
	</div>
</body>
</html>