<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function wincl() {
		window.close();
	}

	function idValue() {		
		var id = '${id}';
		document.getElementById(id).value = opener.document.frm.id.value;
	}
	function idCheck() {
		var id = '${id}';		
		var param = "id"+id
		httpRequest.send(param);
	}

	function sendCheckValue() {
		var result = '${result}';
		var id = '${id}';
		
		if (result !=1) {			
			opener.document.frm.idDuplication.value = "idCheck"; 
			opener.document.frm.id.value = id;		
			
			if (opener != null) {				
				opener.chkForm = null;
				self.close();
			}
		}
	}
	
</script>
</head>
<body>
	<c:set var="id" value="${id }"></c:set>
	<input type="hidden" name="id" value=" ${id }">	
	<c:if test="${result ==1 }">
	 <form id="checkForm">  
		${id } 는 이미 있는 아이디입니땅! 다른 아이디를 입력바랍니땅!
		 <input type="text" name="userId" id="id" placeholder="다른아이디를 입력바랍니땅!" style="position: relative">
		 <!-- <input type="button" value="중복확인" onclick="idCheck">  -->
		<img src="images/fail.jpg" width="400px" height="400px">
		<p>
				 <input type="button" value="사용하기"  onclick="sendCheckValue">
				 <input type="button" value="취소" onclick="wincl()">
	 	</form> 
	</c:if>
	<c:if test="${result !=1 }">
	 <form id="checkForm"> 
		<input type="text" name="userId" id="id" readonly="readonly" value="${id }" style="position: relative">
		는 사용가능합니땅!
		<img src="images/success.jpg" width="400px" height="400px">
		<p>
		<input type="button" value="사용하기"  onclick="sendCheckValue">
		<input type="button" value="취소" onclick="wincl()">
	 	</form> 
	</c:if>	
	<p>
 
		
</body>
</html> --%>