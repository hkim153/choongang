<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<style>
	#upright{
			position: absolute;
   			top: 0px;
   			right: 0px;
   			border-style:solid;
	}
</style>
</head>
<body>
<div id ="upright">
		<a href="main.do">홈으로</a>
		<a href="hs_fishingSiteForm.do">낚시터 홈으로</a>
		<a href="jw_logOut.do">로그아웃하기</a>
</div>
<form action = "hs_userPreferPro.do" method = "get">
	<table border = "1">
		<caption><h2>나에게 딱맞는 낚시터가 있다?!?!</h2></caption>
		<tr><td>지역</td><td>
		<input type = "checkbox" name = "지역" value = "서울특별시">서울특별시
		<input type = "checkbox" name = "지역" value = "경기도">경기도
		<input type = "checkbox" name = "지역" value = "인천광역시">인천광역시
		<input type = "checkbox" name = "지역" value = "강원도">강원도
		<input type = "checkbox" name = "지역" value = "충청북도">충청북도
		<input type = "checkbox" name = "지역" value = "충청남도">충청남도
		<input type = "checkbox" name = "지역" value = "세종특별자치시">세종특별자치시<p>
		<input type = "checkbox" name = "지역" value = "대전광역시">대전광역시
		<input type = "checkbox" name = "지역" value = "전라북도">전라북도
		<input type = "checkbox" name = "지역" value = "전라남도">전라남도
		<input type = "checkbox" name = "지역" value = "광주광역시">광주광역시
		<input type = "checkbox" name = "지역" value = "제주특별자치도">제주특별자치도
		<input type = "checkbox" name = "지역" value = "대구광역시">대구광역시
		<input type = "checkbox" name = "지역" value = "경상북도">경상북도
		<input type = "checkbox" name = "지역" value = "경상남도">경상남도
		<input type = "checkbox" name = "지역" value = "울산광역시">울산광역시
		<input type = "checkbox" name = "지역" value = "부산광역시">부산광역시
		<tr><td>어종</td><td>
		<input type = "checkbox" name = "어종" value = "광어">광어
		<input type = "checkbox" name = "어종" value = "연어">연어
		<input type = "checkbox" name = "어종" value = "문어">문어
		<input type = "checkbox" name = "어종" value = "숭어">숭어
		<input type = "checkbox" name = "어종" value = "송어">송어
		<input type = "checkbox" name = "어종" value = "이면수">이면수
		<input type = "checkbox" name = "어종" value = "산천어">산천어<p>
		<input type = "checkbox" name = "어종" value = "갈치">갈치
		<input type = "checkbox" name = "어종" value = "명태">명태
		<input type = "checkbox" name = "어종" value = "은어">은어
		<tr><td>
		<input type = "submit" value = "확인">
		</td>
		<td>
		<input type = "reset" value = "다시하기">
	</table>

</form>


</body>
</html>