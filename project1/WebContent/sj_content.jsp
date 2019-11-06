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
<caption><h2>회원 등록내역</h2></caption>
	<tr>
		<td>아이디</td>
		<td>${rank.id }</td>
	</tr>
	<tr>
		<td>물고기</td>
		<td>${rank.get_fish }</td>
	</tr>
	<tr>
		<td>사진</td>
		<td><img src="${pageContext.request.contextPath}/${img_folder }/${rank.real_name }"></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${rank.reg_date }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${rank.content }</td>
	</tr>
</table>
${sessionScope.result }
<c:choose>
<c:when test="${sessionScope.result eq 1 }">
	<table>
		<tr>
		${sessionScope.id }-1/${id }-2/${rank.id }-3/${sessionScope.result }-4
		<input type="button" value="삭제"
		onclick="location.href='sj_deleteform.do?num=${num}&id=${id }'">
		</tr>
	</table>
</c:when>
<c:when test="${sessionScope.result ne 1 }">
${sessionScope.id }-1/${id }-2/${rank.id }-3/${sessionScope.result }-4
</c:when>
</c:choose>
<%-- <c:if test="${rank.id }==${id }"> <!-- 로그인하면 삭제버튼이 보이게하는건데 구현안되면 액션에서 해야하는데 일단 패스  -->
	<table>
		<tr>
		<input type="button" value="삭제"
		onclick="location.href='sj_deleteform.do?num=${num}&id=${id }'">
		</tr>
	</table>
</c:if> --%>
</body>
</html>