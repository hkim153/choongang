<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.id{
position: relative;
}
</style>
<script type="text/javascript">
	function wincl() {
		window.close();
	}

	function idValue() {		
		var id = '${id}';
		document.getElementById(id).value = opener.document.frm.id.value;
	}

	function sendCheckValue() {
		var result = '${result}';
		var id = '${id}';
		
		if (result == 0) {			
			
			opener.document.frm.id.value = id;
			opener.document.frm.idDuplication.value = "idCheck";
			
			if (opener != null) {				
				opener.chkForm = null;
				window.close();
			}
		}
	}
	function idCheck() {
		var id = '${id}';		
	}
</script>
</head>
<body>
	<%-- <c:set var="id" value="${id }"></c:set> --%>
	<%-- <input type="hidden" name="id" value=" ${id }"> --%>	
	<c:if test="${result ==1 }">
	<!-- <form action=""> -->
		${id } 는 이미 있는 아이디입니땅! 다른 아이디를 입력바랍니땅!
		<!-- <input type="text" name="id" id="id" placeholder="다른아이디를 입력해주세요." > -->
		<img src="images/fail.jpg" width="400px" height="400px">
	<!-- 	</form> -->
	</c:if>
	<c:if test="${result !=1 }">
	<!-- <form action=""> -->
		${id } 는 사용하실 수 있습니땅!
		<img src="images/success.jpg" width="400px" height="400px">
	<!-- 	</form> -->
	</c:if>	
	<p>
		<!-- <input type="button" value="사용하기" > -->
		<input type="button" value="확인" onclick="wincl()">
</body>
</html>