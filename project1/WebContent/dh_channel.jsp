<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
<!-- <script language="javascript">
function showPopup() { window.open("DH_roomCreate.jsp", "room", "width=400, height=500, left=100, top=50");}
</script> 
 -->
 
</head>
<body>
  <div class="wrap">
  <header> <jsp:include page="header.jsp"></jsp:include> </header>
	<a href="dh_recruitcreate.do">
	<input type="button" value="함께 할 회원을 찾고 싶어요"> <!-- onclick="showPopup();" -->
		</a>

		<a href="dh_recruitboard.do">
	<input type="button" value="야낚자 출항 일정을 보고 싶어요" >
		</a>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
		

	

</body>
</html>