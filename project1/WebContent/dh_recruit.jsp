<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<!-- 방이름 확인문 -->
<!-- <script type="text/javascript">
	function chk() {
		if (!frm.Recruit_title.value) {
			alert("방 이름을 입력해 주세요");
			frm.Recruit_title.focus();
			return false;
		}
		/* if (!frm.Recruit_passwd.value) {
			alert("비밀번호를 입력해 주세요");
			frm.Recruit_passwd.focus();
			return false;
		} */
		if (!frm.Recruit_species.value) {
			alert("어종을 선택해 주세요");
			frm.Recruit_species.focus();
			return false;
		}
	}
</script>
 -->


<!-- 달력 폼 -->
<!-- https://sgroom.tistory.com/63 -->
<!-- jQuery UI CSS 파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">
<!-- jQuery 기본 js 파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function () {
		$( "#datepicker" ).datepicker (
		{
			dateFormat: 'yymmdd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			changeMonth: true,
			changeYear: true,
			showMonthAfterYear: true,
		});
	});
</script>
<!-- 달력 스타일 -->
<style>
.ui-datepicker{font-size: 12px; width: 180px;}
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color:#f00; }
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color:#00f; }
</style>


 
</head>
<body onload="window.resizeTo(400,600)">
 <div class="wrap">
<header> <jsp:include page="header.jsp"></jsp:include> </header>
<h1>인원 모집 하고 싶어요</h1> 
<form action="dh_recruitPro.do" name="frm" method="post" onsubmit="return chk()">
	<input type="hidden" name="Recruit_id" value="${sessionScope.id }">
	<table>
		<tr>
			<td>방 이름</td>
			<td><input type="text" name="Recruit_title" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td><input type="password" name="Recruit_passwd"></td>
		</tr>
		
		<!-- <td>목표 어종</td> -->
		<tr>
			<td>목표 어종</td>
			<td>
				<select id ="f_species" name="Recruit_species" onchange="selb_code()">
						<option value="">어종을 선택해 주세요.</option>
						<c:forEach var="f_species" items="${f_species}">
							<option value="${f_species.f_name}">${f_species.f_name}</option>
						</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>목표 마릿수</td>
			<td>
				<select name="Recruit_goal" size="1">
				<option value="5up">5마리 이상</option>
				<option value="10up">10마리 이상</option>
				<option value="20up">20마리 이상</option>
				<option value="30up">30마리 이상</option>
				<option value="50up">50마리 이상</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>목표 시간</td>
			<td>
				<select name="Recruit_timeset" size="1">
				<option value="3hourup">3시간 이상</option>
				<option value="6hourup">6시간 이상</option>
				<option value="12hourup">12시간 이상</option>
				<option value="1dayup">하루 이상</option>
				<option value="3dayup">3일 이상</option>
				<option value="1weekup">일주일 이상</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>인원 수</td>
			<td>
				<select name="Recruit_member" size="1">
				<option value="5">5명 미만</option>
				<option value="10">10명 미만</option>
				<option value="20">20명 미만</option>
				<option value="30">30명 미만</option>
				<option value="50">50명 미만</option>
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>출항날짜</td>
			<td>
				<input type="text" value="날짜선택" id="datepicker" name="Recruit_event">
				<!-- datepicker를 사용, script의 달력폼으로 -->
			</td>
	</table>
	<table> 
	
		<tr>
		
			<input type="submit" value="방 만들기">
			<input type="button" value="취소" onclick="self.close();"> 
		
		</tr>
		
	</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>