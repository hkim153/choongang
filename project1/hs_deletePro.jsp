<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("작성하신 글이 아니에요 ! ");
		location.href="hs_content.do?num=${num}&pageNum=${pageNum}";
	</script>
</c:if>	

<c:if test="${result == -2 }">
	<script type="text/javascript">
		alert("암호를 확인해주세요 ");
		location.href="hs_deleteForm.do?num=${num}&pageNum=${pageNum}";
	</script>
</c:if>	

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("삭제 완료 ! ");
		location.href="hs_addFishingSiteForm.do?pageNum=${pageNum}";
	</script>
</c:if>	
<c:if test="${result == 0 }">
	<script type="text/javascript">    
		alert("수정오류");
		location.href="hs_deleteForm.do?num=${num}&pageNum=${pageNum}";
	</script>
</c:if>	

</body>
</html>