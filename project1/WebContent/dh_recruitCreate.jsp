<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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
<!-- <body onload="window.resizeTo(400,600)"> -->
<!-- <form action="DH_index.jsp" onsubmit="return chk()">  -->
<h1>함께하기 방 만들기</h1> 
<!-- </form> -->
<form action="dh_recruitwrite.do" name="frm" method="post" onsubmit="return chk()">
	<table>
		<tr>
			<td>방 이름</td>
			<td><input type="text" name="r_title" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="r_passwd"></td>
		</tr>
		
		<!-- <td>목표 어종</td> -->
		<tr>
			<td>목표 어종</td>
			<td>
				<select name="f_code" size="1" class="required" >
			    <option selected disabled>어종을 선택해 주세요</option>
				<option value="F_name">F_name</option>
				<option value="F_name">F_name</option>
				<option value="F_name">F_name</option>
				<option value="F_name">F_name</option>
				<option value="F_name">F_name</option>
				<option value="F_name">F_name</option>   
				</select> 
			</td>
		</tr>
		
		<tr>
			<td>목표 마릿수</td>
			<td>
				<select name="r_goal" size="1">
				<option value="num1">5마리 이상</option>
				<option value="num2">10마리 이상</option>
				<option value="num3">20마리 이상</option>
				<option value="num4">30마리 이상</option>
				<option value="num5">50마리 이상</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>목표 시간</td>
			<td>
				<select name="r_timeset" size="1">
				<option value="num1">3시간 이상</option>
				<option value="num2">6시간 이상</option>
				<option value="num3">12시간 이상</option>
				<option value="num4">하루 이상</option>
				<option value="num5">3일 이상</option>
				<option value="num6">일주일 이상</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>인원 수</td>
			<td>
				<select name="r_member" size="1">
				<option value="num1">5명 미만</option>
				<option value="num2">10명 미만</option>
				<option value="num3">20명 미만</option>
				<option value="num4">30명 미만</option>
				<option value="num5">50명 미만</option>
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>출항날짜</td>
			<td>
				<input type="text" value="날짜선택" id="datepicker">  <!-- e_code 들어가야 함 -->
				<!-- datepicker를 사용, script의 달력폼으로 -->
			</td>
	</table>
	<table> 
	
		<tr>
		
			<input type="submit" value="방 만들기" onclick="location.href='dh_writeForm.do'">
			<input type="button" value="취소" OnClick="javascript:history.back(-1)">

		</tr>
		
	</table>
</form>
</body>
</html>