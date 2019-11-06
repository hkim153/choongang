<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="test.css" rel="stylesheet" type="text/css">
 <style type="text/css">
	#sj_a{
		height:1000px;
		}
</style> 
</head>
<body>
	<div id="wrap">
		<div>
			<header> <jsp:include page="header.jsp"></jsp:include> </header>
		</div>
		<div id="sj_a">
			<table border="1">
				<caption>
					<h2>회원 등록내역</h2>
				</caption>
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
					<td><img
						src="${pageContext.request.contextPath}/${img_folder }/${rank.real_name }"></td>
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
			<c:if test="${sessionScope.result eq 1 }">
				<c:if test="${sessionScope.id == rank.id }">
					<table>
						<tr>
							<input type="button" value="삭제"
								onclick="location.href='sj_deleteform.do?num=${num}&id=${id }'">
						</tr>
					</table>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.result ne 1 }">
			</c:if>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>