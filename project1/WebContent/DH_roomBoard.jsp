<!-- roomCreate functional connection -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	function showPopup() { window.open("DH_roomPopup.html", "roomInfo", "width=400, height=300, left=100, top=50 ");}
</script>

<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {width: 100%}
</style>
</head>
<body>
	<h2>야낚자 오픈채팅방</h2>
	<table>
		<tr>
			<th>방 제목</th>
		</tr>
	</table>
	<input type="button" value="채팅방 제목 여기" onclick="showPopup();">
		<!-- Here is not for "input" method, but instead as for chatroom link -->
</body>
</html>