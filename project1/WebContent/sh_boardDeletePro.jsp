<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
	<c:if test="${result > 0 }">
	<script type="text/javascript">
		confrim("삭제완료");
		location.href="sh_board.do?pageNum=${pageNum}";
	</script>
	</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		confrim("삭제 오류");
		location.href="sh_content.do?b_num=${b_num}&pageNum=${pageNum}&status=0";
	</script>
	</c:if>
	
</body>
</html>