<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<table border="1">
	<caption><h2>${fs.fs_name}</h2></caption>
	<tr><td width="50">번호</td><td>${fs.fs_num}</td></tr>
	<tr><td>작성자</td><td>${fs.id}</td></tr>
	<tr><td>작성일</td><td>${fs.reg_date}</td></tr>
	<tr><td>조회수</td><td>${fs.readcount}</td></tr>
	<tr><td>지역</td><td>${fs.fs_reg}</td></tr>
	<tr><td>주소</td><td>${fs.fs_addr}</td></tr>
	<tr><td>이미지</td><td></td></tr>
	<tr><td>내용</td><td><pre>${fs.fs_content}</pre></td></tr>
	<tr><td colspan="2">
	<input type="button" value="수정" 
	            onclick="location.href='hs_updateForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
	<input type="button" value="삭제"
	            onclick="location.href='hs_deleteForm.do?num=${fs.fs_num}&pageNum=${pageNum}'">
	<input type="button" value="목록"
			    onclick="location.href='hs_addFishingSiteForm.do?pageNum=${pageNum}'"></td></tr>
</table>


</body>
</html>