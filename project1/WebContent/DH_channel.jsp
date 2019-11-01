<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	function showPopup() { window.open("DH_roomCreate.jsp", "room", "width=400, height=500, left=100, top=50");}
</script> 
</head>  
<body> 
<form action="DH_roomBoard.jsp" onsubmit="return chk()">
	<input type="button" value="인원모집 하고 싶어요!" onclick="showPopup();">
	<input type="submit" value="인원 찾아 보고 싶어요!">
</form>
</body>
</html>    