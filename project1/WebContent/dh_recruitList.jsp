<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인원 모집 게시판</h2>
	<table>
		<tr>
			<td><a href="dh_recruit.do">모집하기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>방번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
			<c:forEach var="recruit" items="${list }">
				<tr>
					<td>${recruit.recruit_num }</td>
					<td class="left" width=200>
						 <a href='dh_recruit_content.do?recruit_num=${recruit.recruit_num }&room_manager=${recruit.id}'>
							${recruit.recruit_title}</a>
					</td>
					<td>${recruit.id}</td>
					<td>${recruit.reg_date}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>