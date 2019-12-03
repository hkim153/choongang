<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
/* 게시판 글쓰기 */
#board_write {
	width: 900px;
	position: relative;
	margin: 0 auto;
}

#write_area {
	margin-top: 70px;
	font-size: 14px;
}

#in_name {
	margin-top: 30px;
}

#in_name textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

#in_title {
	margin-top: 30px;
}

#in_title textarea {
	font-weight: bold;
	font-size: 26px;
	color: #333;
	width: 900px;
	border: none;
	resize: none;
}

.wi_line {
	border: solid 1px lightgray;
	margin-top: 10px;
}

#in_content {
	font-size: 20px;
	margin-top: 10px;
}

#in_content textarea {
	font: 14px;
	color: #333;
	width: 900px;
	height: 400px;
	resize: none;
}

#in_pw input {
	font: 14px;
	margin-top: 10px;
}

.bt_se {
	margin-top: 20px;
	text-align: center;
}

.bt_se button {
	width: 100px;
	height: 30px;
}

#write_btn {
	margin-bottom: 30px;
	text-align: center;
}
</style>

<!-- 달력 폼 -->
<!-- https://sgroom.tistory.com/63 -->
<!-- jQuery UI CSS 파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css">
<!-- jQuery 기본 js 파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					minDate : 0,
					dateFormat : 'yymmdd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
				});
	});
</script>

<!-- 달력 스타일 -->
<style>
.ui-datepicker {
	font-size: 12px;
	width: 180px;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:first-child a {
	color: #f00;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:last-child a {
	color: #00f;
}
</style>




</head>
<body onload="window.resizeTo(400,600)">
	<div class="wrap">
		<%--  <c:if test = "${sessionScope.result ne 1 }">
			<script type="text/javascript">
				alert("로그인 해주세요");
				location.href="jw_loginForm.do";
			</script>
		</c:if> --%>
		<header> <jsp:include page="header.jsp"></jsp:include> </header>

		<form action="dh_recruitPro.do" name="frm" method="post">
			<input type="hidden" name="Recruit_id" value="${sessionScope.id }">

			<div id="board_write">
				<h1>인원 모집 하고 싶어요</h1>
				<div id="write-area">


					<div id="in_title">
						<textarea name="recuit_title" id="utitle" rows="1" cols="55"
							placeholder="방이름을 입력하세요" maxlength="100" required></textarea>
					</div>

					<div class="wi_line"></div>


					<!-- 목표 어종 값 불러오기 현재 안뜸. -->
					<div id="in_content">
						<!-- <td>목표 어종</td> -->

						<br>목표 어종 <select id="f_species" name="Recruit_species"
							required="required">
							<option value="">어종을 선택해 주세요.</option>
							<c:forEach var="f_species" items="${f_species}">
								<option value="${f_species.f_name}">${f_species.f_name}</option>
							</c:forEach>
						</select>

						<div class="wi_line"></div>

						<br>
						<br>목표 마릿수 <select name="Recruit_goal" size="1">
							<option value="5마리">5마리 이상</option>
							<option value="10마리">10마리 이상</option>
							<option value="20마리">20마리 이상</option>
							<option value="30마리">30마리 이상</option>
							<option value="50마리">50마리 이상</option>
						</select>


						<div class="wi_line"></div>


						<br>
						<br>목표 시간 <select name="Recruit_timeset" size="1">
							<option value="3시간">3시간</option>
							<option value="6시간">6시간</option>
							<option value="12시간">12시간</option>
							<option value="1일">1일</option>
							<option value="3일">3일</option>
							<option value="일주일">일주일</option>

						</select>

						<div class="wi_line"></div>


						<br>
						<br>인원수 <input type="hidden" id="RMChk" name="RMChk">
						<select name="Recruit_member" size="1">
							<option value="5">5명</option>
							<option value="10">10명</option>
							<option value="20">20명</option>
							<option value="30">30명</option>
							<option value="50">50명</option>
						</select>
						<div class="wi_line"></div>
						<br>
						<br>출항날짜 <input type="text" value="날짜선택" id="datepicker"
							name="Recruit_event" required="required"> <input
							type="hidden" id="CC" name="CC" value="0">

						<!-- datepicker를 사용, script의 달력폼으로 -->
						<div class="wi_line"></div>
					</div>

					<br>
					<br>비밀번호: <input type="password" id="recruit_passwd"
						placeholder="Password">
					<div class="wi_line"></div>
					<div id="write_btn">
						<br>
						<br>
						<input type="submit" value="방 만들기"> <input type="button"
							value="취소" onclick=" history.go(-1);">

					</div>
				</div>

			</div>
	

		</form>
		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	

</body>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</html>