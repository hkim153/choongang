<!-- roomCreate 의 정보를 받아와서 (이미 DB에 정보 저장되었음)
 roomBoard에서 방 누를 시 팝업으로 방정보를 뿌려줌  (그렇다면 호출개념인가?) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="window.resizeTo(400,200)">
<h1>채팅방 입장</h1>
	방 이름
	비밀번호
	목표 어종
	목표 마릿수
	목표 시간
	인원 수
	출항날짜



<table>
	<tr>
		<input type="submit" value="방 입장">
		<input type="button" value="취소" onclick="self.close();">
	</tr>
</table>

</body>
</html>