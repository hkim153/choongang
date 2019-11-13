<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("삭제 완료 ! ");
		location.href="sh_board.do?pageNum=${pageNum}";
	</script>
</c:if>	
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 오류");
		location.href="sh_boardDeleteForm.do?b_num=${b_num}&pageNum=${pageNum}";
	</script>
</c:if>	
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("작성자가 아닙니다");
		location.href="sh_boardDeleteForm.do?b_num=${b_num}&pageNum=${pageNum}";
	</script>
</c:if>	
<c:if test="${result == -2 }">
	<script type="text/javascript">
		alert("암호가 틀립니다");
		location.href="sh_boardDeleteForm.do?b_num=${b_num}&pageNum=${pageNum}";
	</script>
</c:if>	
</body>
</html>