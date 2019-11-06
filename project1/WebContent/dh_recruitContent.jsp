<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<caption><h2>모집 상세내역</h2></caption>
	<tr><td width="50">번호</td><td>${recruit.recruit_num}</td></tr>
	<tr><td>제목</td><td>${recruit.recruit_title}</td></tr>
	<tr><td>작성자</td><td>${recruit.id}</td></tr>
	<tr><td>목표어종</td><td>${recruit.recruit_species}</td></tr>
	<tr><td>목표어획량</td><td>${recruit.recruit_goal}</td></tr>
	<tr><td>어획시간</td><td><pre>${recruit.recruit_timeset}</pre></td></tr>
	<tr><td>모집인원</td><td><pre>${recruit.recruit_member}명</pre></td></tr>
	<tr><td>출항날짜</td><td><pre>${recruit.recruit_event}</pre></td></tr>
	<tr><td>작성일</td><td>${recruit.reg_date}</td></tr>
	<tr><td colspan="2">
	<input type="button" value="채팅방입장"                                     
	            onclick="location.href='dh_recruit_chat_In.do?recruit_num=${recruit.recruit_num }&room_manager=${recruit.id}'">
	<input type="button" value="수정" 
	            onclick="location.href=''">
	<input type="button" value="삭제"
	            onclick="location.href=''">
	<input type="button" value="목록"
			    onclick="location.href='dh_recruitlist.do'"></td></tr>
</table>
</body>
</html>